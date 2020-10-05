import 'dart:convert';

import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable{
  final String token;
  final String type;
  final UserModel user;
  final List<SchoolModel> schools;

  LoginResponse({this.token, this.type, this.user, this.schools});

  @override
  // TODO: implement props
  List<Object> get props => [token, type, user, schools];

  static LoginResponse fromJson(String responseString) {
    Map<String, dynamic> json = jsonDecode(responseString);
    var list = json['schools'] as List;
    List<SchoolModel> schools = json['schools'] != null ? list.map((e) => SchoolModel.fromJson(e)).toList() : [];

    return LoginResponse(
      token: json['token'],
      type: json['type'],
      user: UserModel.fromJson(json['user']),
      schools: schools
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "LoginResponse {token: $token}";
  }
}