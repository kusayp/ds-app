import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Installment extends Equatable {
  String type;
  final int id;
  final int percentage;
  final int dueDate;

  Installment({this.id, this.percentage, this.dueDate, this.type});

  static Installment fromJson(Map<String, dynamic> json){
    return Installment(
      id: json['id'],
      percentage: json['percentage'],
      dueDate: json['dueDate']
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];


}