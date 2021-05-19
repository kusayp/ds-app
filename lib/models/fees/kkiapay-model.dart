// Created by Godslove on 4/1/21.

import 'package:equatable/equatable.dart';

class KKiaPayModel extends Equatable {
  final int student;
  final int fee;
  final int schoolClass;
  final int amount;
  final int payerUserId;
  final String transactionId;
  final int date;

  KKiaPayModel({
    this.student,
    this.fee,
    this.schoolClass,
    this.amount,
    this.payerUserId,
    this.transactionId,
    this.date,
  });

  static Map<String, dynamic> toJson(KKiaPayModel item) {
    // Map<String, dynamic> json = jsonDecode(responseString);

    return {
      'student': item.student,
      'fee': item.fee,
      'amount': item.amount,
      'schoolClass': item.schoolClass,
      'payerUserId': item.payerUserId,
      'transactionId': item.transactionId,
      'date': item.date,
    };
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class KKiaPayArguments extends Equatable {
  final int student;
  final int fee;
  final int schoolClass;
  final int payerUserId;

  KKiaPayArguments({
    this.student,
    this.fee,
    this.schoolClass,
    this.payerUserId,
  });

  @override
  // TODO: implement props
  List<Object> get props => [];
}
