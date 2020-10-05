import 'dart:convert';

import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

class FeesPageData extends Equatable{
  final List<FeesModel> results;

  FeesPageData({this.results});

  static FeesPageData fromJson(response){
    Map<String, dynamic> json = jsonDecode(response);
    var list = json['result'] as List;
    List<FeesModel> fees = json['result'] != null ? list.map((e) => FeesModel.fromJson(e)).toList() : [];
    return FeesPageData(
        results: fees
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}