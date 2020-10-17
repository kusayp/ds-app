import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../models.dart';

class UserModelPageData extends Equatable {
  final int totalElement;
  final int totalPages;
  final List<UserModel> result;

  UserModelPageData({this.totalElement, this.totalPages, this.result});

  static UserModelPageData fromJson(response){
    Map<String, dynamic> json = jsonDecode(response);
    var list = json['result'] as List;
    List<UserModel> users = json['result'] != null ? list.map((e) => UserModel.fromJson(e)).toList() : [];
    return UserModelPageData(
        totalPages :json['totalPages'],
        totalElement: json['totalElement'],
        result: users
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}