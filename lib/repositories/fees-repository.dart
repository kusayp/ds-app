import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class FeesRepository {
  final FeesService feesService;

  FeesRepository({this.feesService});

  Future<FeesPageData> getFees(schoolId) async {
    return await feesService.getFees(schoolId);
  }
}