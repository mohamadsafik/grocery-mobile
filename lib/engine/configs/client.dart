part of 'environment.dart';

abstract class Development {
  static String appName = 'Elkopra';
  static String googleMapKey = '';

  static String baseUrl() {
    switch (Environment.mode) {
      case EnvironmentMode.dev:
        return 'http://127.0.0.1:8000/api/';
      // return 'http://10.0.2.2:8000/api/'; //emulator android
      case EnvironmentMode.production:
        return 'URL PRODUCTION';
    }
  }
}
