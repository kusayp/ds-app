// Created by Godslove on 3/19/21.

import 'package:equatable/equatable.dart';

import '../models.dart';

class PaymentModel extends Equatable{
  final int id;
  final FeeType type;
  final double amount;
  final SchoolClassModel schoolClass;

  PaymentModel({this.id, this.type, this.amount, this.schoolClass});

  static PaymentModel fromJson(Map<String, dynamic> json){
    return PaymentModel(
        id: json['id'],
        type: FeeType.fromJson(json['type']),
        amount: json['amount'],
        schoolClass: json["schoolClass"] != null ? SchoolClassModel.fromJson(json['schoolClass']) : null
    );
  }

  @override
  List<Object> get props => [];
}