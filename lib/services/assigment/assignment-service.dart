import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

class AssignmentService {
  final baseUrl = CommonConstants.baseUrl;
  final url = 'assignments';

  LocalStorage prefs = LocalStorage();

  Future<AssignmentPageData> getAssignmentByClass(schoolId, classId) async {
    String userString = await prefs.getUserDetails();
    LoginResponse user = LoginResponse.fromJson(userString);


    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    var endpoint = sprintf("%s%s/%s/%s?filter=class|%s", [baseUrl, "schools", schoolId, url, classId]);

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new Exception("error getting quotes");
    }
    return AssignmentPageData.fromJson(response.body);
  }

  Future<AssignmentPageData> getAssignmentByTeacher(schoolId, teacherId) async {
    String userString = await prefs.getUserDetails();
    LoginResponse user = LoginResponse.fromJson(userString);


    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    var endpoint = sprintf("%s%s/%s/%s?filter=teacher|%s", [baseUrl, "schools", schoolId, url, teacherId]);

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new Exception("error getting quotes");
    }
    return AssignmentPageData.fromJson(response.body);
  }
}