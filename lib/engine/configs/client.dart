part of 'environment.dart';

abstract class Development {
  static String appName = 'Elkopra';
  static String googleMapKey = '';

  static String baseUrl() {
    switch (Environment.mode) {
      case EnvironmentMode.dev:
        return 'https://newsapi.org/v2/';
      case EnvironmentMode.production:
        return 'URL PRODUCTION';
    }
  }
}
