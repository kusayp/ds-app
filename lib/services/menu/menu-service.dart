import 'dart:convert';

import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:flutter/services.dart';
import 'package:sprintf/sprintf.dart';
import 'package:http/http.dart' as http;

class MenuService {
  LocalStorage sharedPreferences = LocalStorage();
  final baseUrl = CommonConstants.baseUrl;
  final url = 'user-notifications';

  Future<String> _loadUserRoleModules(role) async {
    String roleLower = role.toLowerCase();
    return await rootBundle.loadString('assets/menus/$roleLower.json');
  }

  Future<RoleModules> loadUserRoleModules(role) async {
    String jsonString = await _loadUserRoleModules(role);
    await sharedPreferences.setModules(jsonString);
    final jsonResponse = json.decode(jsonString);
    RoleModules roleModules = RoleModules.fromJson(jsonResponse);
    return roleModules;
  }

  Future<NotificationPageData> fetchNotificationsFilteredByUser(schoolId) async {
    String userString = await sharedPreferences.getUserDetails();
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint = sprintf('%s%s/%s/%s?filter=user|%s', [baseUrl, 'schools', schoolId, url, user.user.id]);

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new Exception("error getting quotes");
    }
    return NotificationPageData.fromJson(response.body);
  }
}