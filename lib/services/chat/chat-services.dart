import 'dart:convert';

import 'package:dsapp/services/chat/db-services.dart';
import 'package:dsapp/services/push_notification_service.dart';
import 'package:dsapp/utils/common-constants.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

class ChatService {
  final baseUrl = CommonConstants.baseUrl;
  final url = 'groups';
  final usersUrl = 'students';
  LocalStorage prefs = LocalStorage();

  Future<GroupPageData> getGroupsInClass(schoolId, classId) async {
    String userString = await prefs.getUserDetails();
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint = sprintf('%s%s/%s/%s/%s/%s', [baseUrl, 'schools', schoolId, 'classes', classId, url]);

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new Exception("error getting quotes");
    }
    return GroupPageData.fromJson(response.body);
  }

  Future<List<UserModel>> getUserInGroups(schoolId, classId, groupId) async {
    String userString = await prefs.getUserDetails();
    LoginResponse user = LoginResponse.fromJson(userString);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + user.token,
    };

    String endpoint = sprintf('%s%s/%s/%s/%s/%s/%s/%s', [baseUrl, 'schools', schoolId, 'classes', classId, url, groupId, usersUrl]);

    final response = await http.get(endpoint, headers: headers,);
    print(response.body);
    if(response.statusCode != 200) {
      print(response.body);
      throw new Exception("error getting quotes");
    }
    List<dynamic> json = jsonDecode(response.body);
    List<UserModel> groups = json != null ? json.map((e) => UserModel.fromJson(e)).toList() : [];
    return groups;
  }

  Future<void> saveChat(token, chatModel, data) async {
    DBServices dbServices = DBServices();
    dbServices.insertChat(chatModel);
    Map<String, dynamic> data = {
    'click_action': 'FLUTTER_NOTIFICATION_CLICK',
    };
    PushNotificationService().sendAndRetrieveMessage(token, chatModel.title, chatModel.message, data);
  }

  Future<List<ChatModel>> fetchChatsFromDb(int toOrFrom) async {
    DBServices dbServices = DBServices();
    return dbServices.getChatsFromDb(toOrFrom);
  }
}