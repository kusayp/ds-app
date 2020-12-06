import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;

class ExamsService {
  final baseUrl = CommonConstants.baseUrl;
  final schoolUrl = CommonConstants.schoolUrl;
  final examinationUrl = 'examinations';
  final scoreUrl = 'scores';

  Future<ExamsPageData> getExams(schoolId) async {

    LocalStorage prefs = LocalStorage();
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);


    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    final response = await http.get(baseUrl+ schoolUrl + schoolId + '/'+examinationUrl, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new RestErrorHandling().handleError(response);
    }
    return ExamsPageData.fromJson(response.body);
  }

  Future<ExamScorePageData> getExamScores(schoolId, examinationId, studentId) async {
    LocalStorage prefs = LocalStorage();
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);


    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    final response = await http.get(baseUrl+ schoolUrl + schoolId + '/'+examinationUrl + '/'+examinationId + '/'+ scoreUrl + "/?filter=student|$studentId", headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new RestErrorHandling().handleError(response);
    }
    return ExamScorePageData.fromJson(response.body);
  }
}