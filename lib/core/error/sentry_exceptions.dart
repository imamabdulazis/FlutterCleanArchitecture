import 'package:clean_architect/core/env/config.dart';
import 'package:sentry/sentry.dart';

///[intialization] sentry
final SentryClient _sentry = new SentryClient(
  dsn: Config.getInstance().apiSentry,
);

///get device in [debug mode]
bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

class SentryException {
  /// Reports [error] along with its [stackTrace] to Sentry.io.
  Future<Null> reportError(dynamic error, dynamic stackTrace) async {
    print('Caught error: $error');

    /// Errors thrown in [development mode] are unlikely to be interesting. You can
    /// check if you are running in dev mode using an assertion and omit sending
    /// the report.
    if (isInDebugMode) {
      print(stackTrace);
      print('In dev mode. Not sending report to Sentry.io.');
      return;
    }

    print('Reporting to Sentry.io...');

    final SentryResponse response = await _sentry.captureException(
      exception: error,
      stackTrace: stackTrace,
    );

    if (response.isSuccessful) {
      print('❎ Success! Event ID: ${response.eventId}');
    } else {
      print('❎ Failed to report to Sentry.io: ${response.error}');
    }
  }
}
