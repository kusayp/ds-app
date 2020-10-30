import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../models.dart';

class NotificationPageData extends Equatable{
  final int totalElement;
  final int totalPages;
  final List<NotificationModel> results;

  NotificationPageData({this.totalElement, this.totalPages, this.results});

  static NotificationPageData fromJson(response){
    Map<String, dynamic> json = jsonDecode(response);
    var list = json['result'] as List;
    List<NotificationModel> notifications = json['result'] != null ? list.map((e) => NotificationModel.fromJson(e)).toList() : [];
    return NotificationPageData(
        totalElement: json['id'],
        totalPages: json['name'],
        results: notifications
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}