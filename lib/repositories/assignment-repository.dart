import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class AssignmentRepository {
  final AssignmentService assignmentService;
  final AnswerService answerService;

  AssignmentRepository({this.assignmentService, this.answerService});

  Future<AssignmentPageData> getAssignmentsClass(schoolId, classId) async {
    return await assignmentService.getAssignmentByClass(schoolId, classId);
  }

  Future<AssignmentPageData> getAssignmentsByTeacher(schoolId, teacherId) async {
    return await assignmentService.getAssignmentByTeacher(schoolId, teacherId);
  }

  Future<AnswerPageData> getAnswers(schoolId, assignmentId) async {
    return await answerService.getAnswers(schoolId, assignmentId);
  }

  Future<void> saveAssignment(schoolId, assignmentModel) async {
    return await assignmentService.saveAssignment(schoolId, assignmentModel);
  }

  Future<void> saveAnswer(schoolId, assignmentId, answerModel) async {
    return await answerService.saveAnswer(schoolId, assignmentId, answerModel);
  }
}