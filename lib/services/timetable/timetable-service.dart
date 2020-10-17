import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

class TimeTableService {
  final baseUrl = CommonConstants.baseUrl;
  final url = 'schedules';
  LocalStorage prefs = LocalStorage();
  Future<TimeTablePageData> getTimeTableFilterDay(schoolId, String day, teacherId) async {
    String userString = await prefs.getUserDetails();
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

//    var queryParameters = {
//      'filter': 'day|$day',
//    };

    String endpoint = sprintf('%s%s/%s/%s?filter=day|%s,teacher|%s', [baseUrl, 'schools', schoolId, url, day, teacherId]);
    print(endpoint);

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new Exception("error getting quotes");
    }
    return TimeTablePageData.fromJson(response.body);
  }

  Future<TimeTablePageData> getTimeTableFilterClass(schoolId, String day, classId) async {
    String userString = await prefs.getUserDetails();
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint = sprintf('%s%s/%s/%s/%s/%s?filter=day|%s', [baseUrl, 'schools', schoolId, 'classes', classId, url, day]);
    print(endpoint);

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new Exception("error getting quotes");
    }
    return TimeTablePageData.fromJson(response.body);
  }
}