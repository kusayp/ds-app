import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final String authToken = "auth_token";
  final String modules = "modules";
  final String user = "user";
  final String onBoarding = "on_boarding";

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

  Future<void> setOnBoardingViewed({bool onBoardingViewed=false}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(this.onBoarding, onBoardingViewed);
  }

  Future<bool> isOnBoardingViewed() async {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      return pref.getBool(this.onBoarding) ?? false;
  }
}