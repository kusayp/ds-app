import 'dart:convert';

import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';


class ClassRegisterPageData extends Equatable {
  final int totalElement;
  final int totalPages;
  final List<ClassRegisterModel> result;

  ClassRegisterPageData({this.totalElement, this.totalPages, this.result});

  static ClassRegisterPageData fromJson(response){
    Map<String, dynamic> json = jsonDecode(response);
    var list = json['result'] as List;
    List<ClassRegisterModel> attendance = json['result'] != null ? list.map((e) => ClassRegisterModel.fromJson(e)).toList() : [];
    return ClassRegisterPageData(
        totalPages :json['totalPages'],
        totalElement: json['totalElement'],
        result: attendance
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}