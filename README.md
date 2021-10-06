# Clean Architecture Flutter Project

 ![last commit](https://img.shields.io/github/last-commit/imamabdulazis/FlutterCleanArchitecture/main) ![last commit](https://app.codacy.com/project/badge/Grade/bc288b78ed0a4377b5e5ef72fdbad535) ![issue](https://img.shields.io/github/issues/imamabdulazis/FlutterCleanArchitecture?color=critical) ![last commit](https://img.shields.io/github/repo-size/imamabdulazis/FlutterCleanArchitecture?color=orange) ![last commit](https://img.shields.io/github/search/imamabdulazis/FlutterCleanArchitecture/flutter%20clean%20architecture?color=brightgreen) ![last commit](https://img.shields.io/github/downloads/imamabdulazis/FlutterCleanArchitecture/total)

This is implementation clean architecture by Uncle Bob. We can implementation this project to make application with many module and component. First we must prepare some library for supporting our project like injector, api consume like dio and many other library we must intall it.  
 In this case I made a facebook clone with rest API and you can clone it anytime and feel free to wait for my update app to make sure the app works properly.

## Getting Started.

![CleanArchitecture](https://user-images.githubusercontent.com/39134128/101283060-f3708c80-380a-11eb-94de-199f0fc01739.jpg)

> ### Installing
>
> You can clone this library using :

```text
git clone https://github.com/imamabdulazis/Flutter-Clean-Architectur-Bloc-RxDart-Dio.git
```

NOTE : This project is using flutter version `1.22.3` and channel `stable`

> ⚠️ If you are get any problem to this project please feel free to create issue

> ### Library Requirement
>
>  We need some library to make our apps is more simple code and clean. This is some library and you can click to install from pub dev.

| Library | Usability | Star |
| :--- | :--- | :---: |
| [dartz](https://pub.dev/packages/dartz) | Data Handling | [![Github Stars](https://img.shields.io/github/stars/spebbe/dartz?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/spebbe/dartz) |
| [dio](https://pub.dev/packages/dio) | Http client | [![Github Stars](https://img.shields.io/github/stars/flutterchina/dio?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/felangel/bloc) |
| [equatable](https://pub.dev/packages/equatable) | Getting data abstract | [![Github Stars](https://img.shields.io/github/stars/felangel/equatable?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/felangel/equatable) |
| [flutter\_hooks](https://pub.dev/packages/flutter_hooks) | More simple code stateful | [![Github Stars](https://img.shields.io/github/stars/rrousselGit/flutter_hooks.svg?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/rrousselGit/flutter_hooks) |
| [flutter\_bloc](https://pub.dev/packages/flutter_bloc) | State management | [![Github Stars](https://img.shields.io/github/stars/felangel/bloc.svg?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/felangel/bloc) |
| [get\_it](https://pub.dev/packages/get_it) | Component Injector | [![Github Stars](https://img.shields.io/github/stars/fluttercommunity/get_it?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/fluttercommunity/get_it) |
| [getx](https://pub.dev/packages/get) | Component handling | [![Github Stars](https://img.shields.io/github/stars/jonataslaw/getx?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/jonataslaw/getx) |
| [pedantic](https://pub.dev/packages/pedantic) | Code formatting | [![Github Stars](https://img.shields.io/github/stars/google/pedantic?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/google/pedantic) |
| [rxdart](https://pub.dev/packages/rxdart) | Data handling async | [![Github Stars](https://img.shields.io/github/stars/reactiveX/rxdart?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/ReactiveX/rxdart) |
| [logger](https://pub.dev/packages/logger) | Beautiful terminal log | [![Github Stars](https://img.shields.io/github/stars/google/pedantic?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/google/pedantic) |
| [shared\_preferences](https://pub.dev/packages/shared_preferences) | Save data local storage | [![Github Stars](https://img.shields.io/github/stars/flutter/plugins?style=flat&logo=github&colorB=blue&label=stars)](https://github.com/flutter/plugins) |

> ## Usecase
>
>  This is part more easy to handling some data error from network or other.

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

> ## Datasource Option
>
> In this part we are enable to make option where data come from local or network
>
> #### Base Datasource \(local or network or other\)
>
> \`\`\`dart abstract class BaseDataSourceFactory { T createData\(DataSourceState dataSourceState\); }

enum DataSourceState { network, local }

```text
>####Datasource factory
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

> ## Resource String Component
>
> #### Handling component handling \(i18n or Localization\)
>
>  In this part we must handling component string and prepare if our project is using multiple language

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

> ### Credit

This architecture is made with love:blush: and more things using great tutorials by great people, please visit this project credit, thank you.

[Flutter Community](https://flutter.dev/community)  
 [Filled stack](https://www.filledstacks.com)  
 [Reso Coder](https://resocoder.com)  
 [Rezky Aulia Pratama](https://github.com/rezkyauliapratama)  
 [Ashish Rawat](https://dev.to/ashishrawat2911/handling-network-calls-and-exceptions-in-flutter-54me)

