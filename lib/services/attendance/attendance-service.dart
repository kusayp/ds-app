import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;

class AttendanceService {
  final baseUrl = CommonConstants.baseUrl;
  final url = 'class-registers';

  Future<ClassRegisterPageData> getAttendance(schoolId, actorId) async {

    LocalStorage prefs = LocalStorage();
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

//    var uri = Uri.http(baseUrl, 'schools' + schoolId.toString() + url, queryParameters);

    var endpoint = baseUrl+"schools/"+schoolId+"/"+url+"/?filter=actor|"+actorId;

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new Exception("error getting quotes");
    }
    return ClassRegisterPageData.fromJson(response.body);
  }
}