import 'dart:convert';

import 'package:dsapp/models/timetable/timetable.dart';
import 'package:equatable/equatable.dart';

class PageData<T>{
  int totalElement;
  int totalPages;
  List<T> result;

  PageData({this.totalElement, this.totalPages, this.result});

//    PageData._fromJson(responseString){
//    Map<String, dynamic> json = jsonDecode(responseString);
//
//      totalElement= json['totalElement'];
//      totalPages= json['totalPages'];
//  }

//  factory PageData.fromJson(response){
//    Map<String, dynamic> json = jsonDecode(response);
//    if(T is TimeTableModel){
//      return TimeTablePageData.fromJson
//    }
//  }
}