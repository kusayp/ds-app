import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

class AssignmentService {
  final baseUrl = CommonConstants.baseUrl;
  final url = 'assignments';

  LocalStorage prefs = LocalStorage();

  Future<AssignmentPageData> getAssignmentByClass(schoolId, classId) async {
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    var endpoint = sprintf("%s%s/%s/%s?filter=class|%s", [baseUrl, "schools", schoolId, url, classId]);

    final response = await http.get(endpoint, headers: headers,);
    if(response.statusCode != 200) {
      throw new RestErrorHandling().handleError(response);
    }
    return AssignmentPageData.fromJson(response.body);
  }

  Future<AssignmentPageData> getAssignmentByTeacher(schoolId, teacherId) async {
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);


    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    var endpoint = sprintf("%s%s/%s/%s?filter=teacher|%s", [baseUrl, "schools", schoolId, url, teacherId]);

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new RestErrorHandling().handleError(response);
    }
    return AssignmentPageData.fromJson(response.body);
  }

  Future<void> saveAssignment(schoolId, assignmentModel) async {
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);


    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    var endpoint = sprintf("%s%s/%s/%s", [baseUrl, "schools", schoolId, url]);

    final response = await http.post(endpoint, headers: headers, body: jsonEncode(assignmentModel));
    if(response.statusCode != 201) {
      throw new RestErrorHandling().handleError(response);
    }
  }

  Future<String> getSignedUrl(String objectKey) async {
      String userString = await prefs.getSharedPreference("user");
      LoginResponse user = LoginResponse.fromJson(userString);

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + user.token,
      };

      var queryParameters = {
        'key': 'files/assignments/$objectKey'
      };

      var uri = Uri.http("dgsapi-env.g5yjwpkx2w.eu-west-1.elasticbeanstalk.com", '/api/v1/mobile/files/upload/url', queryParameters);

      final response = await http.get(uri, headers: headers,);
      print(response.body);
      if(response.statusCode != 200) {
        print(response.body);
        throw new RestErrorHandling().handleError(response);
      }
      return response.body;
  }

  Future<String> getSignedFetchUrl(String objectKey) async {
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);


    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    var endpoint = sprintf("%s%s/%s/%s/%s/%s", [baseUrl, "mobile", "files", "download", objectKey, "url"]);

    final response = await http.get(endpoint, headers: headers,);
    if(response.statusCode != 200) {
      print(response.body);
      throw new RestErrorHandling().handleError(response);
    }
    return response.body;
  }

  Future<void> uploadToS3WithSignedUrl(String uploadUrl, Uint8List file) async {

    Map<String, String> headers = {
      'Content-Type': 'application/octet-stream',
      'x-amz-acl': 'public-read',
    };

    final response = await http.put(uploadUrl, headers: headers,body: file, encoding: Encoding.getByName("utf-8"));
    if(response.statusCode != 200) {
      print(response.body);
      throw new RestErrorHandling().handleError(response);
    }
  }
}