import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

class AttendanceService {
  final baseUrl = CommonConstants.baseUrl;
  final url = 'registers';

  Future<ClassRegisterPageData> getAttendance(schoolId, classId, actorId) async {

    LocalStorage prefs = LocalStorage();
    String userString = await prefs.getSharedPreference("user");
    LoginResponse user = LoginResponse.fromJson(userString);


    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    var endpoint = sprintf("%s%s/%s/%s/%s/%s/%s/%s", [baseUrl, "mobile/schools", schoolId, "classes", classId, "users", actorId, url]);

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new RestErrorHandling().handleError(response);
    }
    return ClassRegisterPageData.fromJson(response.body);
  }
}