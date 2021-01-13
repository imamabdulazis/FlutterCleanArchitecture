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
