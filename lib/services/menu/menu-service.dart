import 'dart:convert';

import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:flutter/services.dart';

class MenuService {
  LocalStorage sharedPreferences = LocalStorage();
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
}