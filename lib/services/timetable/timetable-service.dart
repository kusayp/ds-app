import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;

class TimeTableService {
  final baseUrl = CommonConstants.baseUrl;
  final url = 'schedules';
  LocalStorage prefs = LocalStorage();

  Future<TimeTablePageData> getTimeTableFilterDay(
      schoolId, String day, teacherId) async {
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint =
        "${baseUrl}schools/$schoolId/$url?filter=day|$day,teacher|$teacherId";

    print(endpoint);

    final response = await http.get(
      endpoint,
      headers: headers,
    );
    print(response.body);
    if (response.statusCode != 200) {
      print(response.body);
      throw new RestErrorHandling().handleError(response);
    }
    return TimeTablePageData.fromJson(response.body);
  }

  Future<TimeTablePageData> getTimeTableFilterClass(
      schoolId, String day, classId) async {
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint =
        "${baseUrl}schools/$schoolId/classes/$classId/$url?filter=day|$day";
    print(endpoint);

    final response = await http.get(
      endpoint,
      headers: headers,
    );
    print(response.body);
    if (response.statusCode != 200) {
      print(response.body);
      throw new RestErrorHandling().handleError(response);
    }
    return TimeTablePageData.fromJson(response.body);
  }
}
