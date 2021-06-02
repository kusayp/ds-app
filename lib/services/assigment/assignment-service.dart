import 'dart:convert';
import 'dart:typed_data';

import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';
import 'package:http/http.dart' as http;

class AssignmentService {
  Future<AssignmentPageData> getAssignmentByClass(schoolId, classId) async {
    String path = "/api/v1/schools/$schoolId/assignments";

    Map<String, String> queryParams = {
      "filter": "class|$classId",
      "sort": "due|asc"
    };

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    return AssignmentPageData.fromJson(response);
  }

  Future<AssignmentPageData> getAssignmentByTeacher(schoolId, teacherId) async {
    String path = "/api/v1/schools/$schoolId/assignments";

    Map<String, String> queryParams = {
      "filter": "teacher|$teacherId",
      "sort": "due|asc"
    };

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    return AssignmentPageData.fromJson(response);
  }

  Future<void> saveAssignment(schoolId, assignmentModel) async {
    String path = "/api/v1/schools/$schoolId/assignments";

    var response = await HttpRequest.postExtraParamsRequest(
      path: path,
      data: jsonEncode(assignmentModel),
    );
  }

  Future<String> getSignedUrl(String objectKey) async {
    String path = "/api/v1/mobile/files/upload/url";

    Map<String, String> queryParams = {'key': 'files/assignments/$objectKey'};

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    return response;
  }

  Future<String> getSignedFetchUrl(String objectKey) async {
    String path = "/api/v1/mobile/files/download/$objectKey/url";

    var response = await HttpRequest.getExtraParamsRequest(path: path);

    return response;
  }

  Future<void> uploadToS3WithSignedUrl(String uploadUrl, Uint8List file) async {
    Map<String, String> headers = {
      'Content-Type': 'application/octet-stream',
      'x-amz-acl': 'public-read',
    };

    final response = await http.put(uploadUrl,
        headers: headers, body: file, encoding: Encoding.getByName("utf-8"));
    if (response.statusCode != 200) {
      throw RestErrorHandling.handleError(response);
    }
  }
}
