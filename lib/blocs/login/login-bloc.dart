import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/login/login-event.dart';
import 'package:dsapp/blocs/login/login-state.dart';
import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/models/users/role.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({@required this.loginRepository}) : assert(loginRepository != null), super(LoginInitial());

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    if (event is LoginButtonPressed) {
      yield LoginInitial();
      try {
        final LoginResponse response = await loginRepository.loginResponse(event.username, event.password);
        sharedPreferences.setAuthToken(response.token);
//        var role = response.schools.single.userRole.name;
//        var modules = List<Module>();
//        print(role);
////        if(role == Role.ENSEINGNANT.toString()){
//          RoleModules roleModules = await MenuService().loadUserRoleModules(role);
//          modules = roleModules.modules;
////        }
        yield LoginSuccess(loginResponse: response);
      }
      catch (e) {
        print(e.message);
        yield LoginFailure(error: "error");
      }
    }
  }
}