import 'dart:convert';

import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;

class FeesService {
  final baseUrl = CommonConstants.baseUrl;
  final feesUrl = 'fees';
  final installmentsUrl = 'installments';
  final paymentsUrl = 'payments';
  LocalStorage prefs = LocalStorage();

  Future<FeesPageData> getFees(schoolId, classId, userId) async {
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint =
        "${baseUrl}mobile/schools/$schoolId/classes/$classId/users/$userId/$feesUrl";

    final response = await http.get(
      endpoint,
      headers: headers,
    );
    print(response.body);
    if (response.statusCode != 200) {
      print(response.body);
      throw new RestErrorHandling().handleError(response);
    }
    return FeesPageData.fromJson(response.body);
  }

  Future<InstallmentList> getInstallments(schoolId, feesId) async {
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint =
        "${baseUrl}mobile/schools/$schoolId/$feesUrl/$feesId/$installmentsUrl";

    final response = await http.get(
      endpoint,
      headers: headers,
    );
    print(response.body);
    if (response.statusCode != 200) {
      print(response.body);
      throw new RestErrorHandling().handleError(response);
    }
    return InstallmentList.fromJson(response.body);
  }

  Future<PaymentList> getPayments(schoolId, classId, userId, feesId) async {
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint =
        "${baseUrl}mobile/schools/$schoolId/classes/$classId/users/$userId/$feesUrl/$feesId/$paymentsUrl";

    final response = await http.get(
      endpoint,
      headers: headers,
    );
    print(response.body);
    if (response.statusCode != 200) {
      print(response.body);
      throw new RestErrorHandling().handleError(response);
    }
    return PaymentList.fromJson(response.body);
  }

  Future<void> sendPaymentTransaction(schoolId, KKiaPayModel item) async {
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint =
        "${baseUrl}schools/${schoolId.toString()}/school-fee-transactions";

    final response = await http.post(endpoint,
        headers: headers, body: jsonEncode(KKiaPayModel.toJson(item)));
    if (response.statusCode > 201) {
      throw new RestErrorHandling().handleError(response);
    }
  }
}
