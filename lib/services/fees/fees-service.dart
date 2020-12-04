import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

class FeesService {
  final baseUrl = CommonConstants.baseUrl;
  final feesUrl = 'fees';
  final installmentsUrl = 'installments';
  final paymentsUrl = 'payments';
  Future<FeesPageData> getFees(schoolId, classId, userId) async {

    LocalStorage prefs = LocalStorage();
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint = sprintf('%s%s/%s/%s/%s/%s/%s/%s', [baseUrl, 'mobile/schools', schoolId, 'classes', classId, 'users', userId, feesUrl]);

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new Exception("error getting quotes");
    }
    return FeesPageData.fromJson(response.body);
  }

  Future<InstallmentList> getInstallments(schoolId, feesId) async {

    LocalStorage prefs = LocalStorage();
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint = sprintf('%s%s/%s/%s/%s/%s', [baseUrl, 'mobile/schools', schoolId, feesUrl, feesId, installmentsUrl]);

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new Exception("error getting quotes");
    }
    return InstallmentList.fromJson(response.body);
  }

  Future<PaymentList> getPayments(schoolId, classId, userId, feesId) async {

    LocalStorage prefs = LocalStorage();
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint = sprintf('%s%s/%s/%s/%s/%s/%s/%s/%s/%s', [baseUrl, 'mobile/schools', schoolId, 'classes', classId, 'users', userId, feesUrl, feesId, paymentsUrl]);

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new Exception("error getting quotes");
    }
    return PaymentList.fromJson(response.body);
  }
}