import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:flutter/foundation.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final LoginRepository loginRepository;

  PaymentBloc({@required this.loginRepository}) : assert(loginRepository != null), super(PaymentInitial());

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    if (event is PaymentButtonPressed) {
      yield PaymentInitial();
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
        yield PaymentSuccess(loginResponse: response);
      }
      catch (e) {
        print(e.message);
        yield PaymentFailure(error: "error");
      }
    }
  }
}