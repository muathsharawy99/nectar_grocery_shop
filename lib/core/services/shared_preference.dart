import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future setValue(String key, var value) async {
    if (value.runtimeType == String) {
      prefs.setString(key, value);
    }
    if (value.runtimeType == int) {
      prefs.setInt(key, value);
    }
    if (value.runtimeType == bool) {
      prefs.setBool(key, value);
    }
    if (value.runtimeType == double) {
      prefs.setDouble(key, value);
    }
  }

  static dynamic getValue(String key) {
    return prefs.get(key);
  }

  static Future<void> clear() async {
    await prefs.remove(AppCached.user);
    await prefs.remove(AppCached.token);
  }
}

class AppCached {
  static String user = "user";

  /// Where the old app kept the session token.
  static String token = "token";
}
