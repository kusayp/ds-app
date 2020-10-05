import 'dart:convert';

import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';


class AnswerPageData extends Equatable {
  final int totalElement;
  final int totalPages;
  final List<AnswerModel> result;

  AnswerPageData({this.totalElement, this.totalPages, this.result});

  static AnswerPageData fromJson(response){
    Map<String, dynamic> json = jsonDecode(response);
    var list = json['result'] as List;
    List<AnswerModel> asnwers = json['result'] != null ? list.map((e) => AnswerModel.fromJson(e)).toList() : [];
    return AnswerPageData(
        totalPages :json['totalPages'],
        totalElement: json['totalElement'],
        result: asnwers
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}