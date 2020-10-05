import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';
import 'package:flutter/foundation.dart';

class LoginRepository {
  final LoginService loginService;

  LoginRepository({@required this.loginService})
    : assert(loginService != null);

  Future<LoginResponse> loginResponse(username, password) async {
    print("inside login repo $username");
    return await loginService.login(username, password);
  }
}