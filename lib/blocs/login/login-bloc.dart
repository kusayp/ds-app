import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/login/login-event.dart';
import 'package:dsapp/blocs/login/login-state.dart';
import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/locator.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/services/push_notification_service.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:flutter/foundation.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({@required this.loginRepository}) : assert(loginRepository != null), super(LoginInitial());


  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    final PushNotificationService _pushNotificationService =
    locator<PushNotificationService>();
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        _pushNotificationService.initialise();


        final LoginResponse response = await loginRepository.loginResponse(event.username, event.password);
        sharedPreferences.setSharedPreference("auth_token", response.token);
        _pushNotificationService.getToken().then((value) async {
          print('fcm token: $value');
          loginRepository.updateUserWithFCMToken(1, response, value);
        });
        yield LoginSuccess(loginResponse: response);
      }
      on SocketException catch(_) {
        yield LoginNoConnection();
      }
      on ApiException catch (e) {
        print(e.getMessage());
        yield LoginFailure(error: "error");
      }
    }
  }
}