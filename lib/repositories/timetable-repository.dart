import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class TimeTableRepository {
  final TimeTableService tableService;

  TimeTableRepository({this.tableService});

  Future<TimeTablePageData> getSchedulesFilterByDay(schoolId, day, teacherId) async {
    print("inside login repo $day");
    return await tableService.getTimeTableFilterDay(schoolId, day, teacherId);
  }

  Future<TimeTablePageData> getSchedulesFilterByClass(schoolId, day, classId) async {
    print("inside login repo $day");
    return await tableService.getTimeTableFilterClass(schoolId, day, classId);
  }

}