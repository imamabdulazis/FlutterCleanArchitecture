enum Environment { DEV, STAG, PROD }

///credit : https://medium.com/meeve/build-variants-in-flutter-for-multiple-backend-environments-7e139128949b
///NOTE : build [multiple] application

class ConstantsServer {
  static Map<String, dynamic>? _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.debugConstants;
        break;
      case Environment.STAG:
        _config = _Config.qaConstants;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get serverOne {
    return _config![_Config.SERVER_ONE];
  }

  static get serverTwo {
    return _config![_Config.SERVER_TWO];
  }

  static get serverThree {
    return _config![_Config.WHERE_AM_I];
  }
}

//config multiple server
// ignore: avoid_classes_with_only_static_members
class _Config {
  static const SERVER_ONE = "SERVER_ONE";
  static const SERVER_TWO = "SERVER_TWO";
  static const WHERE_AM_I = "WHERE_AM_I";

  static Map<String, dynamic> debugConstants = {
    SERVER_ONE: "localhost:3000/",
    SERVER_TWO: "localhost:8080/",
    WHERE_AM_I: "local",
  };

  static Map<String, dynamic> qaConstants = {
    SERVER_ONE: "https://staging1.example.com/",
    SERVER_TWO: "https://staging2.example.com/",
    WHERE_AM_I: "staging",
  };

  static Map<String, dynamic> prodConstants = {
    SERVER_ONE: 'https://itsallwidgets.com/',
    SERVER_TWO: "https://flutter.io/",
    WHERE_AM_I: "prod"
  };
}
