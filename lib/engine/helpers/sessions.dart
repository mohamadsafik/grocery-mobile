import 'dart:convert';
import 'package:flutter_cubit/engine/engine.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/models/base/user.dart';

abstract class Sessions {
  static final box = GetStorage();

  static Future clear() async => await GetStorage().erase();

  static Future setToken(String token) async =>
      box.write(SessionKeys.token, token);
  static Future setUserData(String userData) async =>
      box.write(SessionKeys.userData, userData);
  static String? getUserData() => box.read<String>(SessionKeys.userData);
  static String? getToken() => box.read<String>(SessionKeys.token);

  static Future setTheme(Map<String, dynamic> theme) async =>
      box.write(SessionKeys.theme, theme);

  static Map<String, dynamic>? getTheme() =>
      box.read<Map<String, dynamic>>(SessionKeys.theme);

  static User getUser() {
    String? data = Sessions.getUserData();
    User user = User.fromJson(jsonDecode(data!));
    return user;
  }

  static int getUserId() {
    String? data = Sessions.getUserData();
    User user = User.fromJson(jsonDecode(data!));
    return user.id!;
  }
}
