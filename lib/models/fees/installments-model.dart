import 'package:dsapp/models/fees/installment.dart';
import 'package:equatable/equatable.dart';

class InstallmentsModel extends Equatable {
  final int id;
  final int numberOfInstallment;
  final List<Installment>  installment;

  InstallmentsModel({this.id, this.numberOfInstallment, this.installment});

  static InstallmentsModel fromJson(Map<String, dynamic> json){
    var list = json['installments'] as List;
    List<Installment> installments = list.map((e) => Installment.fromJson(e)).toList();
    return InstallmentsModel(
      id: json['id'],
      numberOfInstallment: json['numberOfInstallment'],
      installment: installments
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];


}

class PaymentsModel extends Equatable {
  final int id;
  final double amount;
  final int  date;

  PaymentsModel({this.id, this.amount, this.date});

  static PaymentsModel fromJson(Map<String, dynamic> json){
    return PaymentsModel(
        id: json['id'],
        amount: json['amount'],
        date: json['date'],
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];


}