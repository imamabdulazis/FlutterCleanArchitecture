<!-- This project created by imam abdul azis link : https://imamabdulazis.github.io/portofolio -->

# [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) Flutter Project


<p align="center">
<img alt="last commit" src="https://img.shields.io/github/last-commit/imamabdulazis/FlutterCleanArchitecture/main"/>
<img alt="last commit" src="https://app.codacy.com/project/badge/Grade/bc288b78ed0a4377b5e5ef72fdbad535"/>
<img alt="issue" src="https://img.shields.io/github/issues/imamabdulazis/FlutterCleanArchitecture?color=critical"/>
<img alt="last commit" src="https://img.shields.io/github/repo-size/imamabdulazis/FlutterCleanArchitecture?color=orange"/>
<img alt="last commit" src="https://img.shields.io/github/search/imamabdulazis/FlutterCleanArchitecture/flutter%20clean%20architecture?color=brightgreen"/>
<img alt="last commit" src="https://img.shields.io/github/downloads/imamabdulazis/FlutterCleanArchitecture/total"/>
</p>
<p>
This is implementation clean architecture by Uncle Bob. We can implementation this project to make application with many module and component. First we must prepare some library for supporting our project like injector, api consume like dio and many other library we must intall it.
In this case I made a facebook clone with rest API and you can clone it anytime and feel free to wait for my update app to make sure the app works properly.
</p>

<p>
    Clean Architecture combines a group of practices that produce systems with the following characteristics: </br>
    ✅   Testable </br>
    ✅   UI-independent (the UI can easily be changed without changing the system) </br>
    ✅   Independent of databases, frameworks, external agencies, and libraries </br>
</p>


## Introduction
The dependency rule is the overriding rule that makes Clean Architecture work. It says that nothing in an inner circle should depend on anything in an outer circle. In particular, application and business rules shouldn’t depend on the UI, database, presenters, and so on. These rules allow us to build systems that are simpler to maintain, as changes in outer circles won’t impact inner ones.


## Getting Started.

![CleanArchitecture](https://user-images.githubusercontent.com/39134128/101283060-f3708c80-380a-11eb-94de-199f0fc01739.jpg)


> ### Installing
You can clone this library using :

```shell
git clone https://github.com/imamabdulazis/Flutter-Clean-Architectur-Bloc-RxDart-Dio.git
```

#### Run Project
```shell
flutter run --flavor development
```
You can choose another flavor staging or production or your custom flavor.

<br/>

NOTE :
This project is using flutter version ```1.22.3``` and channel ```stable```
> ⚠️ If you are get any problem to this project please feel free to create issue

<br/>

## Setup Environment (Development, Staging, Production) - Flavor
<p>Before we start using clean patern clean architecture below, we must setting up environment architeture to separate between development, staging, and production part. Ok, let's do it.</p>
<p>
In Flutter we separate environment is using flavor, like .env file in react native actualy
</p>

### Android Part
We must setting in native code kotlin to make channel called name flavor.

> MainActivity.kt

```kotlin
....
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val FlavorChannel = "flavor"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor, FlavorChannel).setMethodCallHandler {
            call, result ->
            result.success(BuildConfig.FLAVOR)
        }
    }
}

```

### iOS part
In ios we must add native code too, this is example using swift code

```swift
 // flavor
    let controller = window.rootViewController as! FlutterViewController

    let flavorChannel = FlutterMethodChannel(
        name: "flavor",
        binaryMessenger: controller.binaryMessenger)

    flavorChannel.setMethodCallHandler({(call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in

      let flavor = Bundle.main.infoDictionary?["Flavor"]
      result(flavor)
    })
    //!flavor
```

then don't forget to setup info plist to make flavor visible when run
```plist
<dic>
...
<key>Flavor</key>
<string>$(APP_FLAVOR)</string>
...
</dic>
```

and then setup project from xcode like this.
<br/>
![Screen Shot 2021-01-28 at 5 16 33 PM](https://user-images.githubusercontent.com/39134128/106123786-f3e32f00-618c-11eb-982d-bf80c42bfe32.png)
![Screen Shot 2021-01-28 at 5 22 54 PM](https://user-images.githubusercontent.com/39134128/106124294-81268380-618d-11eb-8c1f-0094fd8756bc.png)


last part don't forget clone scheme and rename like flavor name.
<br/>
![Screen Shot 2021-01-28 at 5 20 39 PM](https://user-images.githubusercontent.com/39134128/106124000-30168f80-618d-11eb-99d7-02a3833d5bd9.png)

## Flavor 
### Dart part
>Config flavor file

```dart
class Config {
  final String flavorName;
  final String apiBaseUrl;
  final String apiSentry;

  Config({
    this.flavorName,
    this.apiBaseUrl,
    this.apiSentry,
  });

  static Config _instance;

  static Config getInstance({
    flavorName,
    apiBaseUrl,
    apiSentry,
  }) {
    if (_instance == null) {
      _instance = Config(
        flavorName: flavorName,
        apiBaseUrl: apiBaseUrl,
        apiSentry: apiSentry,
      );
      return _instance;
    }
    return _instance;
  }
}
```
>flavor file
```dart
import 'config.dart';

class FlavorSettings {
  FlavorSettings.development() {
    Config.getInstance(
      flavorName: 'development',
      apiBaseUrl: 'http://dev-url',
      apiSentry: 'http://sentry-url',
    );
  }

  FlavorSettings.staging() {
    Config.getInstance(
      flavorName: 'staging',
      apiBaseUrl: 'http://dev-stag',
      apiSentry: 'http://sentry-url',
    );
  }

  FlavorSettings.production() {
    Config.getInstance(
      flavorName: 'production',
      apiBaseUrl: 'http://dev-prod',
      apiSentry: 'http://sentry-url',
    );
  }
}
```

Last we call flavor inside ```main.dart```

```dart
import module....

///[get debug mode]
bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

void main() async {
  /// [Catch some error]
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (!kReleaseMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  /// [run apps] with catch error
  runZoned<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyBlocObserver();
    await getFlavorSetting();
    await di.init();
    await disableLendscapeMode();
    disableErrorWidget();
    runApp(new MyApp());

    ///[console] flavor running
    if (!kReleaseMode) {
      final settings = Config.getInstance();
      print('🚀 APP FLAVOR NAME      : ${settings.flavorName}');
      print('🚀 APP API_BASE_URL     : ${settings.apiBaseUrl}');
      print('🚀 APP API_SENTRY       : ${settings.apiSentry}');
    }
  }, onError: (error, stackTrace) async {
    final sentryException = di.sl<SentryException>();
    sentryException.reportError(error, stackTrace);
    print("❎ ERROR OTHER   :$error");
    print("❎ STACKTRACE    :$stackTrace");
  });
}

/// [disable error] widget when [release mode]
void disableErrorWidget() {
  if (kReleaseMode) {
    ErrorWidget.builder = (details) {
      print('Error widget trigerred on :${details.exception}');
      print(details.stack.toString());
      return Container();
    };
  }
}

/// [disable landscape] model
Future<void> disableLendscapeMode() async {
  await SystemChrome.setPreferredOrientations(([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]));
}

///[environment] configuration
Future<FlavorSettings> getFlavorSetting() async {
  String flavor =
      await const MethodChannel('flavor').invokeMethod<String>('getFlavor');

  if (flavor == 'development') {
    return FlavorSettings.development();
  } else if (flavor == 'staging') {
    return FlavorSettings.staging();
  } else if (flavor == 'production') {
    return FlavorSettings.production();
  } else {
    throw Exception("Oopss... Flavor name missing");
  }
}
```

### Bonus - Sentry Exceptions
<p>
Sentry's application monitoring platform helps every developer
diagnose, fix, and optimize the performance of their code.
</p>

```dart
import modele....

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
```

<p>The Dependency Rule
Source code dependencies only point inwards. This means inward modules are neither aware of nor dependent on outer modules. However, outer modules are both aware of and dependent on inner modules. Outer modules represent the mechanisms by which the business rules and policies (inner modules) operate. The more you move inward, the more abstraction is present. The outer you move the more concrete implementations are present. Inner modules are not aware of any classes, functions, names, libraries, etc.. present in the outer modules. They simply represent rules and are completely independent from the implementations.</p>

## Layers
### Domain
<p>The Domain module defines the business logic of the application. It is a module that is independent from the development platform i.e. it is written purely in the programming language and does not contain any elements from the platform. The reason for that is that Domain should only be concerned with the business logic of the application, not with the implementation details. This also allows for easy migration between platforms, should any issues arise.</p>

### Contents of Domain
<h4>Domain is made up of several things.</h4>

### Entities
✅   Enterprise-wide business rules </br>
✅   Made up of classes that can contain methods </br>
✅   Business objects of the application </br>
✅   Used application-wide </br>
✅   Least likely to change when something in the application changes </br>

### Usecases
✅   Application-specific business rules </br>
✅   Encapsulate all the usecases of the application </br>
✅   Orchestrate the flow of data throughout the app </br>
✅   Should not be affected by any UI changes whatsoever </br>
✅   Might change if the functionality and flow of application change </br>

### Repositories
✅   Abstract classes that define the expected functionality of outer layers </br>
✅   Are not aware of outer layers, simply define expected functionality </br>
✅   E.g. The Login usecase expects a Repository that has login functionality </br>
✅   Passed to Usecases from outer layers </br>
✅   Domain represents the inner-most layer. Therefore, it the most abstract layer in the architecture. </br>

<br/>

### Library Requirement
<p>
We need some library to make our apps is more simple code and clean.
This is some library and you can click to install from pub dev.
</p> 


| Library                                                           | Usability                 |   Star    |
| :-----------------------------------------------------------------|:--------------------------|:---------:|
| [dartz](https://pub.dev/packages/dartz)                           | Data Handling             | [![Github Stars](https://img.shields.io/github/stars/spebbe/dartz?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/spebbe/dartz) |
| [dio](https://pub.dev/packages/dio)                               | Http client               | [![Github Stars](https://img.shields.io/github/stars/flutterchina/dio?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/felangel/bloc)    |
| [equatable](https://pub.dev/packages/equatable)                   | Getting data abstract     | [![Github Stars](https://img.shields.io/github/stars/felangel/equatable?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/felangel/equatable)    |
| [flutter_hooks](https://pub.dev/packages/flutter_hooks)           | More simple code stateful | [![Github Stars](https://img.shields.io/github/stars/rrousselGit/flutter_hooks.svg?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/rrousselGit/flutter_hooks)    |
| [flutter_bloc](https://pub.dev/packages/flutter_bloc)             | State management          | [![Github Stars](https://img.shields.io/github/stars/felangel/bloc.svg?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/felangel/bloc)      |
| [get_it](https://pub.dev/packages/get_it)                         | Component Injector        | [![Github Stars](https://img.shields.io/github/stars/fluttercommunity/get_it?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/fluttercommunity/get_it)     |
| [getx](https://pub.dev/packages/get)                              | Component handling        | [![Github Stars](https://img.shields.io/github/stars/jonataslaw/getx?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/jonataslaw/getx)       |
| [pedantic](https://pub.dev/packages/pedantic)                     | Code formatting           | [![Github Stars](https://img.shields.io/github/stars/google/pedantic?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/google/pedantic)     |
| [rxdart](https://pub.dev/packages/rxdart)                         | Data handling async       | [![Github Stars](https://img.shields.io/github/stars/reactiveX/rxdart?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/ReactiveX/rxdart)     |
| [logger](https://pub.dev/packages/logger)                         | Beautiful terminal log    | [![Github Stars](https://img.shields.io/github/stars/google/pedantic?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/google/pedantic)     |
| [shared_preferences](https://pub.dev/packages/shared_preferences) | Save data local storage   | [![Github Stars](https://img.shields.io/github/stars/flutter/plugins?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/flutter/plugins)     |


## Code Explanation
<p>In some case we cannot implementation code by theary and just reading some tutorial without complete code. So here we go, I was build some code and improve some code from some tutorial and make it better I think :), I hope in this part can help us to make some simple Boilerplate.</p>

### Usecase

<p>
This is part more easy to handling some data error from network or other.
</p>

```dart
abstract class UseCase<Type, Params> {
  Stream<Either<Failure, Type>> build(Params params);

  Stream<Either<Failure, Type>> execute(Params params) {
    return build(params).onErrorResume((error) {
      print("error from streams : $error");
      Failure failure;

      if (error is Failure) {
        failure = error;
      } else if (error is DioError) {
        failure = ServerFailure(message: error.message);
      } else {
        failure = AnotherFailure(message: "$error");
      }

      return Stream.value(Left(failure));
    });
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
```

<br/>
<br/>

## Datasource Option 
<p>In this part we are enable to make option where data come from local or network</p>

>####Base Datasource (local or network or other)
```dart
abstract class BaseDataSourceFactory<T> {
  T createData(DataSourceState dataSourceState);
}

enum DataSourceState { network, local }
```

#### Datasource factory
```dart
class BindingDataSourceFactory
    extends BaseDataSourceFactory<BindingDataSource> {
  BindingRemote _bindingRemote;
  BindingLocal _bindingLocal;

  BindingDataSourceFactory({
    @required BindingRemote bindingRemote,
    @required BindingLocal bindingLocal,
  })  : _bindingRemote = bindingRemote,
        _bindingLocal = bindingLocal;

  @override
  BindingDataSource createData(DataSourceState dataSourceState) {
    switch (dataSourceState) {
      case DataSourceState.network:
        return _bindingRemote;
        break;
      case DataSourceState.local:
        return _bindingLocal;
      default:
        throw UnsupportedError(
            'DataSourceState $dataSourceState is not applicable in BindingDataSourceFactory');
    }
  }
}
```

<br/>

## Resource String Component
#### Handling component handling (i18n or Localization)
<p>
In this part we must handling component string and prepare if our project 
is using multiple language
</p>

```dart
//NOTE : base translation class
abstract class Translation {
  String get msgEmailInUse;
  String get msgInvalidCredentials;
  String get msgInvalidField;
  String get msgRequiredField;
  String get msgUnexpectedError;

  String get addAccount;
  String get confirmPassword;
  String get email;
  String get enter;
  String get login;
  String get name;
  String get password;
  String get reload;
  String get wait;
}

//NOTE : implement to language class

class ID implements Translation {
  String get msgEmailInUse => 'Email sudah digunakan';
  String get msgInvalidCredentials => 'Username atau password salah.';
  String get msgInvalidField => 'Bidang tidak valid';
  String get msgRequiredField => 'Kolom yang harus diisi';
  String get msgUnexpectedError => 'Ada yang salah. Silahkan coba lagi nanti.';

  String get addAccount => 'Buat sebuah akun';
  String get confirmPassword => 'Konfirmasi sandi';
  String get email => 'Email';
  String get enter => 'Gabung';
  String get login => 'Login';
  String get name => 'Nama';
  String get password => 'Kata sandi';
  String get reload => 'Muat ulang';
  String get wait => 'Tunggu...';
}


class R {
  static Translation string = ID();

  static void load(Locale locale) {
    switch (locale.toString()) {
      default:
        string = ID();
        break;
    }
  }
}

example calling :
    R.string.msgEmailInUse 
output :
    Email sudah digunakan

```



<br/>
<br/>

> ### Credit

This architecture is made with love:blush: and more things using great tutorials by great people, please visit this
project credit, thank you.

[Flutter Community](https://flutter.dev/community)<br/>
[Filled stack](https://www.filledstacks.com)<br/>
[Reso Coder](https://resocoder.com)<br/>
[Rezky Aulia Pratama](https://github.com/rezkyauliapratama)<br/>
[Ashish Rawat](https://dev.to/ashishrawat2911/handling-network-calls-and-exceptions-in-flutter-54me)
