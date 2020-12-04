import 'dart:convert';

import 'package:dsapp/models/assignment/assignment.dart';
import 'package:equatable/equatable.dart';


class AssignmentPageData extends Equatable {
  final int totalElement;
  final int totalPages;
  final List<AssignmentModel> result;

  AssignmentPageData({this.totalElement, this.totalPages, this.result});

  static AssignmentPageData fromJson(response){
    Map<String, dynamic> json = jsonDecode(response);
    var list = json['result'] as List;
    List<AssignmentModel> assignments = json['result'] != null ? list.map((e) => AssignmentModel.fromJson(e)).toList() : [];
    return AssignmentPageData(
        totalPages :json['totalPages'],
        totalElement: json['totalElement'],
        result: assignments
    );
  }

  @override
  List<Object> get props => [];
}