import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class TimeTableRepository {
  final TimeTableService tableService;

  TimeTableRepository({this.tableService});

  Future<TimeTablePageData> getSchedulesFilterByDay(schoolId, day) async {
    print("inside login repo $day");
    return await tableService.getTimeTableFilterDay(schoolId, day);
  }

}