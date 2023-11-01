import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'engine/base/app.dart';
import 'engine/configs/environment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class InitialApps {
  static start() async {
    await setup();
    await firebaseInit();
  }

  static setup() async {
    await GetStorage.init();

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    Environment.appVersion = packageInfo.version;
    Environment.appBuildNumber = packageInfo.buildNumber;

    initializeDateFormatting(Environment.currentLanguages.languageCode);

    observers.clear();
    observers.add(RouteObserver<PageRoute>());
  }

  static firebaseInit() async {}
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
