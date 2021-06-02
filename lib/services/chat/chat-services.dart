import 'dart:convert';

import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class ChatService {
  Future<GroupPageData> getGroupsInClass(schoolId, classId, userId) async {
    String path = "/api/v1/mobile/schools/$schoolId/classes/$classId/groups";

    Map<String, String> queryParams = {
      "filter": "user|$userId",
      // "sort": "due|asc"
    };

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    return GroupPageData.fromJson(response);
  }

  Future<GroupPageData> getTeachersParentsGroups(schoolId, classId) async {
    String path =
        "/api/v1/mobile/schools/$schoolId/classes/$classId/teachers-parents-groups";

    Map<String, String> queryParams = {
      // "filter": "teacher|$teacherId",
      "sort": "due|asc"
    };

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    return GroupPageData.fromJson(response);
  }

  Future<List<UserModel>> getUserInGroups(schoolId, classId, groupId) async {
    String path =
        "/api/v1/mobile/schools/$schoolId/classes/$classId/groups/$groupId/users";

    Map<String, String> queryParams = {
      // "filter": "teacher|$teacherId",
      "sort": "firstName|asc"
    };

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    List<dynamic> json = jsonDecode(response);
    List<UserModel> groups =
        json != null ? json.map((e) => UserModel.fromJson(e)).toList() : [];
    return groups;
  }

  Future<List<UserModel>> getUserInTeachersParentsGroups(
      schoolId, classId, groupId) async {
    String path =
        "/api/v1/mobile/schools/$schoolId/classes/$classId/teachers-parents-groups/$groupId/users";

    Map<String, String> queryParams = {
      // "filter": "teacher|$teacherId",
      "sort": "due|asc"
    };

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    List<dynamic> json = jsonDecode(response);
    List<UserModel> groups =
        json != null ? json.map((e) => UserModel.fromJson(e)).toList() : [];
    return groups;
  }
}
