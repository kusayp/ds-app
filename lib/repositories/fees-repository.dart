import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class FeesRepository {
  final FeesService feesService;

  FeesRepository({this.feesService});

  Future<FeesPageData> getFees(schoolId, classId, userId) async {
    return await feesService.getFees(schoolId, classId, userId);
  }

  Future<InstallmentList> getInstallments(schoolId, feesId) async {
    return await feesService.getInstallments(schoolId, feesId);
  }

  Future<PaymentList> getPaymentList(schoolId, classId, userId, feesId) async {
    return await feesService.getPayments(schoolId, classId, userId, feesId);
  }

  Future<void> sendPaymentTransaction(int schoolId, KKiaPayModel item) async {
    return await feesService.sendPaymentTransaction(schoolId, item);
  }
}