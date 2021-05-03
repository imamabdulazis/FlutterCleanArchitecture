import 'dart:io';

import 'package:get/get.dart';
import 'package:sentry/sentry.dart';
import 'package:device_info/device_info.dart';

import '../env/config.dart';

Future<SentryEvent> sentryException({
  required String loggerType,
  required String message,
  String? tags,
  required dynamic extra,
  String? baseUrl,
  String? prefix,
  String? requestMethod,
  String? screen,
  required dynamic exception,
}) async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  late AndroidDeviceInfo androidInfo;
  late IosDeviceInfo iosInfo;
  if (Platform.isAndroid) {
    androidInfo = await deviceInfo.androidInfo;
  } else {
    iosInfo = await deviceInfo.iosInfo;
  }

  return SentryEvent(
    exception: exception,
    logger: loggerType,
    environment: Config.getInstance().flavorName,
    message:SentryMessage(message),
    user: SentryUser(
      id: 'id user',
      username: 'username',
      email: 'email',
      extras: extra,
    ),
    breadcrumbs: [
      Breadcrumb(
        message: loggerType.contains('api') ? 'API Service' : 'UI Lifecycle',
        timestamp: DateTime.now().toUtc(),
        category: loggerType.contains('api') ? 'api.service' : 'ui.lifecycle',
        type: loggerType,
        data: loggerType.contains('api')
            ? {'baseUrl': baseUrl, 'prefix': prefix, 'method': requestMethod}
            : {'screen': screen, 'state': 'created'},
        level: SentryLevel.info,
      )
    ],
    contexts: Contexts(
      operatingSystem: SentryOperatingSystem(
        name: Platform.isAndroid ? 'Android' : 'IOS',
        version: Platform.isAndroid
            ? androidInfo.version.toString()
            : iosInfo.systemVersion,
        build: Platform.isAndroid ? androidInfo.model : iosInfo.model,
        kernelVersion:
            Platform.isAndroid ? androidInfo.hardware : iosInfo.utsname.version,
        rooted: false,
      ),
      app: SentryApp(
        name: 'Name of Apps',
        version: '1.0.0',
        identifier: 'com.apps.module',
        buildType: 'release',
        startTime: DateTime.now().toUtc(),
      ),
      device: SentryDevice(
        name: Platform.isAndroid ? androidInfo.product : iosInfo.name,
        family: Platform.isAndroid
            ? androidInfo.manufacturer
            : iosInfo.identifierForVendor,
        model: Platform.isAndroid ? androidInfo.model : iosInfo.model,
        modelId: Platform.isAndroid ? androidInfo.id : iosInfo.utsname.nodename,
        arch:
            Platform.isAndroid ? androidInfo.hardware : iosInfo.utsname.machine,
        brand: Platform.isAndroid ? androidInfo.brand : iosInfo.name,
        manufacturer: Platform.isAndroid
            ? androidInfo.manufacturer
            : iosInfo.utsname.machine,
        screenResolution: '${Get.width.toInt()} x ${Get.height.toInt()}',
      ),
    ),
  );
}
