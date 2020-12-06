import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/firebase/firebase-services.dart';
import 'package:dsapp/services/services.dart';
import 'package:flutter/foundation.dart';

class LoginRepository {
  final LoginService loginService;
  final FirebaseService firebaseService;

  LoginRepository({@required this.loginService, this.firebaseService})
    : assert(loginService != null);

  Future<LoginResponse> loginResponse(username, password) async {
    print("inside login repo $username");
    return await loginService.login(username, password);
  }

  Future<void> updateUserWithFCMToken(schoolId, LoginResponse response, String token) async {
    return await loginService.updateUser(schoolId, response, token);
  }

  Future<void> loginToFirebaseWithWithCustomToken(UserModel userModel, String pushToken) async {
    return await firebaseService.loginWithWithToken(userModel, pushToken) ;
  }
}