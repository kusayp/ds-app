import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class ExamsService {
  Future<ExamsPageData> getExams(schoolId) async {
    String path = "/api/v1/schools/$schoolId/examinations";

    Map<String, String> queryParams = {"sort": "startDate|asc"};

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    return ExamsPageData.fromJson(response);
  }

  Future<ExamsPageData> getClassExams(schoolId, classId) async {
    String path = "/api/v1/schools/$schoolId/examinations";

    Map<String, String> queryParams = {"sort": "startDate|asc"};

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    return ExamsPageData.fromJson(response);
  }

  Future<ExamScorePageData> getExamScores(
      schoolId, examinationId, studentId) async {
    String path =
        "/api/v1/schools/$schoolId/examinations/$examinationId/scores";

    Map<String, String> queryParams = {
      "filter": "student|$studentId",
      "sort": "date|asc"
    };

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    return ExamScorePageData.fromJson(response);
  }

  Future<ExamScorePageData> getStudentExamScores(
      schoolId, examinationId, studentId) async {
    String path =
        "/api/v1/schools/$schoolId/examinations/$examinationId/scores";

    Map<String, String> queryParams = {
      "filter": "student|$studentId",
      "sort": "date|asc"
    };

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    return ExamScorePageData.fromJson(response);
  }
}
