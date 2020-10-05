import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final String auth_token = "auth_token";
  final String modules = "modules";
  final String user = "user";
  final String on_boarding = "on_boarding";

  //set data into shared preferences like this
  Future<void> setAuthToken(String auth_token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.auth_token, auth_token);
  }

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
    prefs.setBool(this.on_boarding, onBoardingViewed);
  }

  Future<bool> isOnBoardingViewed() async {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      return pref.getBool(this.on_boarding) ?? false;
  }


  //set data into shared preferences like this
  Future<void> setUserDetails(String user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.user, user);
  }

//get value from shared preferences
  Future<String> getUserDetails() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String user;
    user = pref.getString(this.user) ?? null;
    return user;
  }

  //set object value into shared preferences
  Future<void> setModules(String modules) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(this.modules, modules);
  }

  //get value from shared preferences
  Future<String> getModules() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String modules;
    modules = pref.getString(this.modules) ?? null;
    return modules;
  }
}