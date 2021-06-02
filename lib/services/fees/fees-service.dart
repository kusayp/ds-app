import 'dart:convert';

import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class FeesService {
  Future<FeesPageData> getFees(schoolId, classId, userId) async {
    String path =
        "/api/v1/mobile/schools/$schoolId/classes/$classId/users/$userId/fees";

    // Map<String, dynamic> queryParams = {"sort": "due|asc"};

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      // queryParams: queryParams,
    );

    return FeesPageData.fromJson(response);
  }

  Future<InstallmentList> getInstallments(schoolId, feesId) async {
    String path = "/api/v1/mobile/schools/$schoolId/fees/$feesId/installments";

    // Map<String, dynamic> queryParams = {"sort": "due|asc"};

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      // queryParams: queryParams,
    );

    return InstallmentList.fromJson(response);
  }

  Future<PaymentList> getPayments(schoolId, classId, userId, feesId) async {
    String path =
        "/api/v1/mobile/schools/$schoolId/classes/$classId/users/$userId/fees/$feesId/payments";

    // Map<String, dynamic> queryParams = {"sort": "due|asc"};

    var response = await HttpRequest.getExtraParamsRequest(
      path: path,
      // queryParams: queryParams,
    );

    return PaymentList.fromJson(response);
  }

  Future<void> sendPaymentTransaction(schoolId, KKiaPayModel item) async {
    String endpoint = "schools/${schoolId.toString()}/school-fee-transactions";

    var response = await HttpRequest.postRequest(
        url: endpoint, data: jsonEncode(KKiaPayModel.toJson(item)));
  }
}
