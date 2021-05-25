import 'dart:convert';

import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class AnswerService {
  static const url = 'answers';

  Future<AnswerPageData> getAnswers(schoolId, int assignmentId) async {
    var endpoint =
        "$schoolId/${AssignmentService.url}/${assignmentId.toString()}/$url?sort='createdAt|asc'";

    var response = await GetHttpRequest.getRequest(url: endpoint);

    return AnswerPageData.fromJson(response);
  }

  Future<void> saveAnswer(schoolId, int assignmentId, answerModel) async {
    var endpoint =
        "$schoolId/${AssignmentService.url}/${assignmentId.toString()}/$url";

    var response = await GetHttpRequest.postRequest(
      url: endpoint,
      data: jsonEncode(answerModel),
    );
  }
}
