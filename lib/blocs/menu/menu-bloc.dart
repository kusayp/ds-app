import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:flutter/foundation.dart';

import '../blocs.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuService menuService;
  LocalStorage prefs = LocalStorage();

  MenuBloc({@required this.menuService})
      : assert(menuService != null),
        super(MenuInitial());

  @override
  Stream<MenuState> mapEventToState(MenuEvent event) async* {
    String myLocale = await prefs.getSharedPreference("locale");
    if (event is MenuDropDownSelected) {
      yield MenuInitial();
      bool isStudentParent = event.role == "STUDENT";
      String user = await prefs.getSharedPreference("user");
      UserModel studentUser = UserModel();
      if (isStudentParent) {
        String studentUserPrefs =
            await prefs.getSharedPreference("studentUser");
        Map<String, dynamic> json = jsonDecode(studentUserPrefs);
        studentUser = UserModel.fromJson(json);
        await prefs.setSharedPreference("userId", studentUser.id.toString());
      } else {
        prefs.setSharedPreference("schoolId", event?.school?.id.toString());
        prefs.setSharedPreference(
            "school", json.encode(SchoolModel.toJson(event?.school)));
      }
      try {
        LoginResponse loginResponse = LoginResponse.fromJson(user);
        prefs.setSharedPreference("userId", loginResponse.user.id.toString());
        List<Module> list = [];
        var modules = List<Module>();

        RoleModules roleModules =
            await menuService.loadUserRoleModules("${event.role}-$myLocale");

        if (roleModules.role == "PARENT") {
          for (var i = 0; i < event.school.children.length; i++) {
            list.add(Module(
              id: event.school.children[i].id,
              menu: "parent_student",
              url: "parent_student",
              icon: "assets/images/menu/Profile.svg",
              studentUser: event.school.children[i],
              description: event.school.children[i].firstName +
                  " " +
                  event.school.children[i].lastName,
            ));
          }
          modules.insertAll(0, list);
        }

        if (!loginResponse.user.classPrefect &&
            roleModules.role == "APPRENANT") {
          roleModules.modules.removeAt(6);
          modules.insertAll(modules.length, roleModules.modules);
        } else {
          modules.insertAll(modules.length, roleModules.modules);
        }
        RoleModules item = RoleModules(
          user: isStudentParent ? studentUser : loginResponse.user,
          role: roleModules.role,
          modules: modules,
          school: event.school,
        );
        prefs.setSharedPreference("role", roleModules.role);
        if (roleModules.role == "APPRENANT") {
          prefs.setSharedPreference(
              'schoolClassId', event.school.studentClass.id.toString());
        }
        yield MenuSuccess(
            modules: modules, role: roleModules.role, roleModules: item);
      } catch (e) {
        yield MenuFailure(error: "error");
      }
    }

    if (event is NotificationIconClicked) {
      yield MenuLoading();
      try {
        var userId = await prefs.getSharedPreference("userId");
        NotificationPageData notificationPageData = await menuService
            .fetchNotificationsFilteredByUser(event.school, userId);
        yield NotificationSuccess(notifications: notificationPageData.results);
      } catch (_) {}
    }
  }
}
