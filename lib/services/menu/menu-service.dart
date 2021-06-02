import 'dart:convert';

import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:flutter/services.dart';

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
    await sharedPreferences.setSharedPreference("modules", jsonString);
    final jsonResponse = json.decode(jsonString);
    RoleModules roleModules = RoleModules.fromJson(jsonResponse);
    return roleModules;
  }

  Future<NotificationPageData> fetchNotificationsFilteredByUser(
      schoolId, userId) async {
    String path = "/api/v1/schools/$schoolId/user-notifications";

    Map<String, String> queryParams = {"filter": "user|$userId"};

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    return NotificationPageData.fromJson(response);
  }
}
