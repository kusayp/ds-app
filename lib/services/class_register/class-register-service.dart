import 'dart:convert';

import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class ClassRegisterService {
  Future<TimeTablePageData> getClassSchedule(schoolId, classId) async {
    String path = "/api/v1/schools/$schoolId/classes/$classId/schedules";

    Map<String, String> queryParams = {"sort": "startTime|asc"};

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    return TimeTablePageData.fromJson(response);
  }

  Future<TimeTablePageData> getListOfActorsInClass(
      schoolId, classId, scheduleId) async {
    String path = "/api/v1/schools/$schoolId/classes/$classId/schedules";

    Map<String, String> queryParams = {
      "filter": "subject|$scheduleId",
      "sort": "due|asc"
    };

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    return TimeTablePageData.fromJson(response);
  }

  Future<UserModelPageData> getActorsInClass(schoolId, classId, url) async {
    String path = "/api/v1/schools/$schoolId/classes/$classId/$url";

    Map<String, String> queryParams = {"sort": "firstName|asc"};

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      queryParams: queryParams,
    );

    return UserModelPageData.fromJson(response);
  }

  Future<void> saveClassRegister(
      schoolId, classSchedule, userId, present) async {
    String path = "/api/v1/schools/$schoolId/class-registers";

    final Map<String, dynamic> data = {
      "actor": userId,
      "classSchedule": classSchedule,
      "present": present
    };
    var response = await HttpRequest.postExtraParamsRequest(
      path: path,
      data: jsonEncode(data),
    );
  }

  Future<void> saveClassRegisterBatch(
    String schoolId,
    TimeTableModel classSchedule,
    List<ClassRegisterSave> classRegisters,
  ) async {
    String path =
        "/api/v1/mobile/schools/$schoolId/classes/${classSchedule.schoolClass.id}/registers/batch";

    final Map<String, List<Map<String, dynamic>>> data = {
      "registers": classRegisters.isNotEmpty
          ? classRegisters.map((e) => ClassRegisterSave.toJson(e)).toList()
          : null,
    };
    var response = await HttpRequest.postExtraParamsRequest(
      path: path,
      data: jsonEncode(data),
    );
  }
}
