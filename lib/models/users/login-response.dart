import 'package:dsapp/models/school/school-model.dart';
import 'package:dsapp/models/users/user-model.dart';

class LoginResponse{
  String token;
  String type;
  UserModel user;
  List<SchoolModel> schools;

  LoginResponse.fromJson(Map json)
      :
        token = json['token'],
        type = json['type'],
        user = json['user'],
        schools = json['schools'];
}