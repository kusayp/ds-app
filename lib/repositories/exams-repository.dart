import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class ExamsRepository {
  final ExamsService examsService;

  ExamsRepository({this.examsService});

  Future<ExamsPageData> getExams(schoolId) async {
    return await examsService.getExams(schoolId);
  }
}