import 'dart:convert';

import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';


class GroupPageData extends Equatable {
  final int totalElement;
  final int totalPages;
  final List<GroupModel> result;

  GroupPageData({this.totalElement, this.totalPages, this.result});

  static GroupPageData fromJson(response){
    Map<String, dynamic> json = jsonDecode(response);
    var list = json['result'] as List;
    List<GroupModel> groups = list != null ? list.map((e) => GroupModel.fromJson(e)).toList() : [];
    return GroupPageData(
      totalElement: json['totalElement'],
      totalPages: json['totalPages'],
      result: groups,
    );
  }

  @override
  List<Object> get props => [];
}