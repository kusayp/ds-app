import 'dart:convert';

import 'package:dsapp/models/exams/exams.dart';
import 'package:equatable/equatable.dart';

class ExamsPageData extends Equatable{
  final int totalElement;
  final int totalPages;
  final List<ExamsModel> results;

  ExamsPageData({this.totalElement, this.totalPages, this.results});

  static ExamsPageData fromJson(response){
    Map<String, dynamic> json = jsonDecode(response);
    var list = json['result'] as List;
    List<ExamsModel> exams = json['result'] != null ? list.map((e) => ExamsModel.fromJson(e)).toList() : [];
    return ExamsPageData(
        totalElement: json['id'],
        totalPages: json['name'],
        results: exams
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}