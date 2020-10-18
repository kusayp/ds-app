import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;
//import 'package:sprintf/sprintf.dart';

class AnswerService {
  final baseUrl = CommonConstants.baseUrl;
  final url = 'answers';

  Future<AnswerPageData> getAnswers(schoolId, int assignmentId) async {

    LocalStorage prefs = LocalStorage();
    String userString = await prefs.getUserDetails();
    LoginResponse user = LoginResponse.fromJson(userString);


    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

//    var endpoint = sprintf("%%/%/%/%/%", [baseUrl, "schools", schoolId, AssignmentService().url, assignmentId, url]);
    var endpoint = baseUrl+"schools/"+schoolId+"/"+AssignmentService().url+"/"+assignmentId.toString()+"/"+url;

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new Exception("error getting quotes");
    }
    return AnswerPageData.fromJson(response.body);
  }
}