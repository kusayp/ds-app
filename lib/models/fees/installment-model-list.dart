import 'dart:convert';

import 'package:dsapp/models/fees/installments-model.dart';
import 'package:equatable/equatable.dart';

class InstallmentList extends Equatable {
  final List<InstallmentsModel> list;

  InstallmentList({this.list});

  static InstallmentList fromJson(response){
    List<dynamic> json = jsonDecode(response);
    List<InstallmentsModel> installments = json != null ? json.map((e) => InstallmentsModel.fromJson(e)).toList() : [];
    return InstallmentList(
        list: installments
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PaymentList extends Equatable {
  final List<PaymentsModel> list;

  PaymentList({this.list});

  static PaymentList fromJson(response){
    List<dynamic> json = jsonDecode(response);
    List<PaymentsModel> installments = json != null ? json.map((e) => PaymentsModel.fromJson(e)).toList() : [];
    return PaymentList(
        list: installments
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}