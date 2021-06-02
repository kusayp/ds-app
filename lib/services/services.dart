import 'dart:convert';

import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;

export 'answers/answer-service.dart';
export 'assigment/assignment-service.dart';
export 'attendance/attendance-service.dart';
export 'chat/chat-services.dart';
export 'class_register/class-register-service.dart';
export 'exams/exams-service.dart';
export 'fees/fees-service.dart';
export 'login/login-service.dart';
export 'menu/menu-service.dart';
export 'onboarding/onboarding-api.dart';
export 'timetable/timetable-service.dart';

class HttpRequest {
  // static var token = "";
  static getToken() async {
    final LocalStorage prefs = LocalStorage();
    String token = await prefs.getSharedPreference(LocalStorage.authToken);
    return token;
  }

  static getRequest({url, queryParams}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer ${await getToken()}",
    };

    var endpoint = "${CommonConstants.baseUrl}$url";

    // var uri = Uri.https(CommonConstants.baseUrl, url, queryParams);

    final response = await http.get(endpoint, headers: headers);
    // .timeout(
    // Duration(seconds: 30),
    // onTimeout: () => throw SocketException(""));

    if (response.statusCode != 200) {
      throw RestErrorHandling.handleError(response);
    }
    return utf8.decode(response.bodyBytes);
  }

  static postRequest({url, data}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer ${await getToken()}",
    };

    var endpoint = "${CommonConstants.baseUrl}schools/$url";

    final response = await http.post(endpoint, headers: headers, body: data);

    if (response.statusCode > 201) {
      throw RestErrorHandling.handleError(response);
    }
    return response.body;
  }

  static getExtraParamsRequest({path, queryParams}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer ${await getToken()}",
    };

    var uri = Uri.http(CommonConstants.baseUri, path, queryParams);

    final response = await http.get(uri, headers: headers);

    if (response.statusCode != 200) {
      throw RestErrorHandling.handleError(response);
    }
    return utf8.decode(response.bodyBytes);
  }

  static postExtraParamsRequest({path, data, queryParams}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer ${await getToken()}",
    };

    var uri = Uri.http(CommonConstants.baseUri, path, queryParams);

    final response = await http.post(uri, headers: headers, body: data);

    if (response.statusCode > 201) {
      throw RestErrorHandling.handleError(response);
    }
    return response.body;
  }

  static putExtraParamsRequest({path, String data, queryParams}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer ${await getToken()}",
    };

    var uri = Uri.http(CommonConstants.baseUri, path, queryParams);

    final response = await http.put(uri, headers: headers, body: data);

    if (response.statusCode > 201) {
      throw RestErrorHandling.handleError(response);
    }
  }

  static postExtraParamsRequestNoAuth({path, data, queryParams}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    var uri = Uri.http(CommonConstants.baseUri, path, queryParams);

    final response = await http.post(uri, headers: headers, body: data);

    if (response.statusCode > 201) {
      throw RestErrorHandling.handleError(response);
    }
    return response.body;
  }
}
