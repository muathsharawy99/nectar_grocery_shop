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

  static Future<void> clearValue(String key) async {
    await prefs.remove(key);
  }

  static Future<void> clear() async {
    await prefs.remove(AppCached.user);
    await prefs.remove(AppCached.token);
    await prefs.remove(AppCached.id);
    await prefs.remove(AppCached.name);
    await prefs.remove(AppCached.email);
    await prefs.remove(AppCached.phone);
    await prefs.remove(AppCached.phoneCode);
    await prefs.remove(AppCached.image);
    await prefs.remove(AppCached.unReadNotify);
  }
}

class AppCached {
  static String user = "user";
  static String id = "id";
  static String name = "name";
  static String phoneCode = "phone_code";
  static String phone = "phone";
  static String email = "email";
  static String image = "image";
  static String lang = "lang";
  static String country = "country";
  static String token = "token";
  static String deviceToken = "device_token";
  static String unReadNotify = "unReadNotify";
  static String isFirstTime = "is_first_time";
}
