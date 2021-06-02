import 'dart:convert';

import 'package:dsapp/models/models.dart';
import 'package:dsapp/models/users/login-response.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/shared-preference.dart';

class LoginService {
  LocalStorage sharedPreferences = LocalStorage();
  final loginPath = '/api/v1/mobile/authentication/login';
  final usersUrl = '/api/v1/users/';

  Future<LoginResponse> login(username, password) async {
    final Map<String, dynamic> data = {
      "username": username,
      "password": password
    };

    var response = await HttpRequest.postExtraParamsRequestNoAuth(
        path: loginPath, data: jsonEncode(data));

    LoginResponse loginResponse = LoginResponse.fromJson(response);
    await sharedPreferences.setSharedPreference(LocalStorage.user, response);

    return loginResponse;
  }

  Future<void> updateUser(
      schoolId, LoginResponse _response, String fcmToken) async {
    String endpoint = "$usersUrl${_response.user.id}";

    final Map<String, dynamic> data = {
      "deviceId": fcmToken,
    };

    await HttpRequest.putExtraParamsRequest(
      path: endpoint,
      data: jsonEncode(data),
    );
  }

  Future<UserModel> getUserById(userId) async {
    String endpoint = "$usersUrl$userId";

    var response = await HttpRequest.getExtraParamsRequest(path: endpoint);

    Map<String, dynamic> json = jsonDecode(response);

    return UserModel.fromJson(json);
  }
}
