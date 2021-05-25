import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String authToken = "auth_token";
  static const String modules = "modules";
  static const String user = "user";
  static const String onBoarding = "on_boarding";

  //set data into shared preferences like this
  Future<void> setSharedPreference(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> getSharedPreference(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var value = pref.getString(key) ?? null;
    return value;
  }

  Future<void> setOnBoardingViewed({bool onBoardingViewed = false}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(onBoarding, onBoardingViewed);
  }

  Future<bool> isOnBoardingViewed() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(onBoarding) ?? false;
  }
}
