abstract class APIResult {
  static const int success = 200;
  static const int failed = 404;
  static const int invalid = 401;
}

abstract class SessionKeys {
  static const String token = 'token';
  static const String theme = 'theme';
  static const String userData = 'user';
}
