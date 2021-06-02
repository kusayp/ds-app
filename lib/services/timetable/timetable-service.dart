import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class TimeTableService {
  Future<TimeTablePageData> getTimeTableFilterDay(
      schoolId, String day, teacherId) async {
    String path = "/api/v1/schools/$schoolId/schedules";

    Map<String, String> queryParams = {
      "filter": "day|$day,teacher|$teacherId",
      "sort": "startTime|asc"
    };

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    return TimeTablePageData.fromJson(response);
  }

  Future<TimeTablePageData> getTimeTableFilterClass(
      schoolId, String day, classId) async {
    String path = "/api/v1/schools/$schoolId/classes/$classId/schedules";

    Map<String, String> queryParams = {
      "filter": "day|$day",
      "sort": "startTime|asc"
    };

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    return TimeTablePageData.fromJson(response);
  }
}
