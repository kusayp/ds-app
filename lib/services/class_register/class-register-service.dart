import 'dart:convert';

import 'package:dsapp/exceptions/api-exceptions.dart';
import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

class ClassRegisterService {
  final baseUrl = CommonConstants.baseUrl;
  final mobileBaseUrl = CommonConstants.baseUrl + 'mobile/schools';
  final url = 'schedules';
  final addUrl = 'class-register';
  final batchUrl = 'registers/batch';
  LocalStorage prefs = LocalStorage();
  Future<TimeTablePageData> getClassSchedule(schoolId, classId) async {
    String userString = await prefs.getUserDetails();
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint = sprintf('%s%s/%s/%s/%s/%s', [baseUrl, 'schools', schoolId, 'classes', classId, url]);

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new Exception("error getting quotes");
    }
    return TimeTablePageData.fromJson(response.body);
  }

  Future<TimeTablePageData> getListOfActorsInClass(schoolId, classId, scheduleId) async {
    String userString = await prefs.getUserDetails();
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint = sprintf('%s%s/%s/%s/%s/%s?filter=subject|%s', [baseUrl, 'schools', schoolId, 'classes', classId, url, scheduleId]);

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new Exception("error getting quotes");
    }
    return TimeTablePageData.fromJson(response.body);
  }

  Future<UserModelPageData> getActorsInClass(schoolId, classId, url) async {
    String userString = await prefs.getUserDetails();
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint = sprintf('%s%s/%s/%s/%s/%s', [baseUrl, 'schools', schoolId, 'classes', classId, url]);

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new Exception("error getting quotes");
    }
    return UserModelPageData.fromJson(response.body);
  }

  Future<void> saveClassRegister(schoolId, classSchedule, userId, present) async {
    String userString = await prefs.getUserDetails();
    LoginResponse user = LoginResponse.fromJson(userString);
    String endpoint = sprintf('%s%s/%s/%s', [baseUrl, 'schools', schoolId, 'class-registers']);

    final Map<String, dynamic> data = {
      "actor": userId,
      "classSchedule": classSchedule,
      "present": present
    };
    final response = await http.post(endpoint,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + user.token,
        },
        body: jsonEncode(data)
    );

    if(response.statusCode != 200) {
      print(response.body);
      print("Success");
    }
    print(response.body);
  }

  Future<void> saveClassRegisterBatch(String schoolId, TimeTableModel classSchedule, List<ClassRegisterSave> classRegisters) async {
    String userString = await prefs.getUserDetails();
    LoginResponse user = LoginResponse.fromJson(userString);
    String endpoint = sprintf('%s/%s/%s/%s/%s', [mobileBaseUrl, schoolId, 'classes', classSchedule.schoolClass.id, batchUrl]);

    final Map<String, List<ClassRegisterSave>> data = {
      "registers": classRegisters,
    };
    final response = await http.get(endpoint,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + user.token,
        },
//        body: jsonEncode(data)
    );

    if(response.statusCode != 200) {
      print(response.body);
      print("Success");
      throw new RestErrorHandling().handleError(response);
    }
    print(response.body);
  }
}