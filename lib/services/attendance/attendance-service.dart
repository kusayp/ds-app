import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class AttendanceService {
  Future<ClassRegisterPageData> getAttendance(
      schoolId, classId, actorId) async {
    String path =
        "/api/v1/mobile/schools/$schoolId/classes/$classId/users/$actorId/registers";

    // Map<String, dynamic> queryParams = {
    //   // "filter": "teacher|$teacherId",
    //   // "sort": "due|asc"
    // };

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      // queryParams: queryParams,
    );

    return ClassRegisterPageData.fromJson(response);
  }
}
