import 'dart:convert';

import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class AnswerService {
  Future<AnswerPageData> getAnswers(schoolId, int assignmentId) async {
    var path =
        "/api/v1/schools/$schoolId/assignments/${assignmentId.toString()}/answers";

    Map<String, String> queryParams = {
      // "filter": "teacher|$teacherId",
      "sort": "createdAt|asc"
    };

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    return AnswerPageData.fromJson(response);
  }

  Future<void> saveAnswer(schoolId, int assignmentId, answerModel) async {
    var path =
        "/api/v1/schools/$schoolId/assignments/${assignmentId.toString()}/answers";

    var response = await HttpRequest.postExtraParamsRequest(
      path: path,
      data: jsonEncode(answerModel),
    );
  }
}
