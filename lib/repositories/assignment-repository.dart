import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class AssignmentRepository {
  final AssignmentService assignmentService;
  final AnswerService answerService;

  AssignmentRepository({this.assignmentService, this.answerService});

  Future<AssignmentPageData> getAssignments(schoolId) async {
    return await assignmentService.getAssignment(schoolId);
  }

  Future<AnswerPageData> getAnswers(schoolId, assignmentId) async {
    return await answerService.getAnswers(schoolId, assignmentId);
  }
}