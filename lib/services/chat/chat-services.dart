import 'dart:convert';

import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;

class ChatService {
  final baseUrl = CommonConstants.baseUrl;
  final url = 'groups';
  final usersUrl = 'users';
  final parentsUrl = 'teachers-parents-groups';
  LocalStorage prefs = LocalStorage();

  Future<GroupPageData> getGroupsInClass(schoolId, classId, userId) async {
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint =
        "${baseUrl}mobile/schools/$schoolId/classes/$classId/$url?filter=user|$userId";

    final response = await http.get(
      endpoint,
      headers: headers,
    );
    print(response.body);
    if (response.statusCode != 200) {
      print(response.body);
      throw new RestErrorHandling().handleError(response);
    }
    return GroupPageData.fromJson(response.body);
  }

  Future<GroupPageData> getTeachersParentsGroups(schoolId, classId) async {
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint =
        "${baseUrl}mobile/schools/$schoolId/classes/$classId/$parentsUrl";

    final response = await http.get(
      endpoint,
      headers: headers,
    );
    print(response.body);
    if (response.statusCode != 200) {
      print(response.body);
      throw new RestErrorHandling().handleError(response);
    }
    return GroupPageData.fromJson(response.body);
  }

  Future<List<UserModel>> getUserInGroups(schoolId, classId, groupId) async {
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint =
        "${baseUrl}mobile/schools/$schoolId/classes/$classId/$url/$groupId/$usersUrl";

    final response = await http.get(
      endpoint,
      headers: headers,
    );
    print(response.body);
    if (response.statusCode != 200) {
      print(response.body);
      throw new RestErrorHandling().handleError(response);
    }
    List<dynamic> json = jsonDecode(response.body);
    List<UserModel> groups =
        json != null ? json.map((e) => UserModel.fromJson(e)).toList() : [];
    return groups;
  }

  Future<List<UserModel>> getUserInTeachersParentsGroups(
      schoolId, classId, groupId) async {
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint =
        "${baseUrl}mobile/schools/$schoolId/classes/$classId/$parentsUrl/$groupId/$usersUrl";

    final response = await http.get(
      endpoint,
      headers: headers,
    );
    print(response.body);
    if (response.statusCode != 200) {
      print(response.body);
      throw new RestErrorHandling().handleError(response);
    }
    List<dynamic> json = jsonDecode(response.body);
    List<UserModel> groups =
        json != null ? json.map((e) => UserModel.fromJson(e)).toList() : [];
    return groups;
  }
}
