import 'dart:convert';

import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/models/users/login-response.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

class LoginService {
  LocalStorage sharedPreferences = LocalStorage();
  final baseUrl = CommonConstants.baseUrl;
  final loginUrl = 'mobile/authentication/login/';
  final usersUrl = 'users';

  Future<LoginResponse> login(username, password) async {
    final url = baseUrl + loginUrl;

    final Map<String, dynamic> data = {
      "username": username,
      "password": password
    };
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json'
        },
        body: jsonEncode(data)
    );

    if(response.statusCode != 200) {
      print("error getting quotes");
      print(response.body);
      throw new Exception("error getting quotes");
    }
    await sharedPreferences.setUserDetails(response.body);
    return LoginResponse.fromJson(response.body);
  }

  Future<void> updateUser(schoolId, LoginResponse _response, String token) async {
    String endpoint = sprintf('%s%s/%s', [baseUrl, usersUrl, _response.user.id]);

    final Map<String, dynamic> data = {
      "deviceId": token,
    };
    final response = await http.put(endpoint,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + _response.token,
        },
        body: jsonEncode(data)
    );

    if(response.statusCode != 200) {
      throw new RestErrorHandling().handleError(response);
    }

    if(response.statusCode == 200) {
      print("success");
    }
  }

  Future<UserModel> getUserById(userId,) async {
    String userString = await sharedPreferences.getUserDetails();
    LoginResponse user = LoginResponse.fromJson(userString);
    String endpoint = sprintf('%s%s/%s', [baseUrl, usersUrl, userId]);
    final response = await http.get(endpoint,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
        },
    );

    if(response.statusCode != 200) {
      print("error getting quotes");
      print(response.body);
      throw new Exception("error getting quotes");
    }
    Map<String, dynamic> json = jsonDecode(response.body);
    return UserModel.fromJson(json);
  }

}
