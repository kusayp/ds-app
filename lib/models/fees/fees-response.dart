// Created by Godslove on 5/19/21.

import 'package:equatable/equatable.dart';

class FeesResponse extends Equatable {
  final String apiTransactionId;
  final int amount;
  final int date;
  final int status;

  FeesResponse({this.amount, this.apiTransactionId, this.status, this.date});

  static FeesResponse fromJson(Map<String, dynamic> json) {
    return FeesResponse(
      apiTransactionId: json['apiTransactionId'],
      date: json['date'],
      amount: json['amount'],
      status: json["status"],
    );
  }

  @override
  List<Object> get props => [apiTransactionId, amount, date, status];
}
