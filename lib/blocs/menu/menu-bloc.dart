import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:flutter/foundation.dart';

import '../blocs.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuService menuService;

  MenuBloc({@required this.menuService}) : assert(menuService != null), super(MenuInitial());

  @override
  Stream<MenuState> mapEventToState(MenuEvent event) async* {
    if (event is MenuDropDownSelected) {
      yield MenuInitial();
      try {
        print(event.school.userRole.name);
        LocalStorage prefs = LocalStorage();
        var modules = List<Module>();
        RoleModules roleModules = await menuService.loadUserRoleModules(event.school.userRole.name);
        modules = roleModules.modules;
        prefs.setSharedPreference("role", roleModules.role);
        prefs.setSharedPreference("schoolId", event.school.id.toString());
        yield MenuSuccess(modules: modules);
      }
      catch (e) {
        print(e.message);
        yield MenuFailure(error: "error");
      }
    }
  }
}