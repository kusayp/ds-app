import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../models.dart';

class TimeTablePageData extends Equatable {
  final int totalElement;
  final int totalPages;
  final List<TimeTableModel> result;

  TimeTablePageData({this.totalElement, this.totalPages, this.result});

  static TimeTablePageData fromJson(response){
    Map<String, dynamic> json = jsonDecode(response);
    var list = json['result'] as List;
    List<TimeTableModel> timeTables = json['result'] != null ? list.map((e) => TimeTableModel.fromJson(e)).toList() : [];
    return TimeTablePageData(
        totalPages :json['totalPages'],
        totalElement: json['totalElement'],
        result: timeTables
    );
  }

  @override
  List<Object> get props => [];
}