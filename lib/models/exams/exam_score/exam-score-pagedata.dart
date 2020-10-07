import 'dart:convert';

import 'package:dsapp/models/exams/exams.dart';
import 'package:equatable/equatable.dart';

class ExamScorePageData extends Equatable{
  final int totalElement;
  final int totalPages;
  final List<ExamScoreModel> results;

  ExamScorePageData({this.totalElement, this.totalPages, this.results});

  static ExamScorePageData fromJson(response){
    Map<String, dynamic> json = jsonDecode(response);
    var list = json['result'] as List;
    List<ExamScoreModel> scores = json['result'] != null ? list.map((e) => ExamScoreModel.fromJson(e)).toList() : [];
    return ExamScorePageData(
        totalElement: json['id'],
        totalPages: json['name'],
        results: scores
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}