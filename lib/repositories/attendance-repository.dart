import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class AttendanceRepository {
  final AttendanceService attendanceService;
//  final AnswerService answerService;

  AttendanceRepository({this.attendanceService});

  Future<ClassRegisterPageData> getAttendance(schoolId, actorId) async {
    return await attendanceService.getAttendance(schoolId, actorId);
  }

//  Future<AnswerPageData> getAnswers(schoolId, assignmentId) async {
//    return await answerService.getAnswers(schoolId, assignmentId);
//  }
}