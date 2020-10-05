import 'dart:convert';

import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/models/users/login-response.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;

class LoginService {
  LocalStorage sharedPreferences = LocalStorage();

  Future<LoginResponse> login(username, password) async {
    final url = CommonConstants.baseUrl + 'authentication/login/';

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

//    print(response.statusCode);
    if(response.statusCode != 200) {
      print("error getting quotes");
      print(response.body);
      throw new Exception("error getting quotes");
    }
    await sharedPreferences.setUserDetails(response.body);
    return LoginResponse.fromJson(response.body);
  }

}
