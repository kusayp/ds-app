import 'dart:collection';

import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;

class TimeTableService {
  Future<TimeTablePageData> getTimeTableFilterDay(int schoolId, String day) async {
    final baseUrl = CommonConstants.baseUrl;
    final url = 'schedules';

    LocalStorage prefs = LocalStorage();
    String userString = await prefs.getUserDetails();
    LoginResponse user = LoginResponse.fromJson(userString);


    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    var queryParameters = {
      'filter': 'day|$day',
    };

//    var uri = Uri.http(baseUrl, 'schools' + schoolId.toString() + url, queryParameters);

    final response = await http.get(baseUrl+'schools/' + schoolId.toString() + '/'+url+'?filter=day|'+day, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new Exception("error getting quotes");
    }
    return TimeTablePageData.fromJson(response.body);
  }
}