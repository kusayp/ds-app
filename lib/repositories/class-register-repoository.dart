import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class ClassRegisterRepository {
  final ClassRegisterService classRegisterService;

  ClassRegisterRepository({this.classRegisterService});

  Future<TimeTablePageData> getSchedules(schoolId, classId) async {
    return await classRegisterService.getClassSchedule(schoolId, classId);
  }

  Future<UserModelPageData> getClassActors(schoolId, classId, url) async {
    return await classRegisterService.getActorsInClass(schoolId, classId, url);
  }

  Future<void> saveClassRegister(schoolId, classSchedule, userId, present) async {
    return await classRegisterService.saveClassRegister(schoolId, classSchedule, userId, present);
  }
  Future<void> saveClassRegisterInBatch(String schoolId, TimeTableModel classSchedule, List<ClassRegisterSave> classRegisters) async {
    return await classRegisterService.saveClassRegisterBatch(schoolId, classSchedule, classRegisters);
  }
}