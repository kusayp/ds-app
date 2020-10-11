import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/login/login-event.dart';
import 'package:dsapp/blocs/login/login-state.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:flutter/foundation.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({@required this.loginRepository}) : assert(loginRepository != null), super(LoginInitial());


  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final LoginResponse response = await loginRepository.loginResponse(event.username, event.password);
        sharedPreferences.setAuthToken(response.token);
        yield LoginSuccess(loginResponse: response);
      }
      catch (e) {
        print(e.message);
        yield LoginFailure(error: "error");
      }
    }
  }
}