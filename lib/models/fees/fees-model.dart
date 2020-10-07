import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

class FeesModel extends Equatable{
  final int id;
  final String type;
  final double amount;
  final SchoolClassModel schoolClass;

  FeesModel({this.id, this.type, this.amount, this.schoolClass});

  static FeesModel fromJson(Map<String, dynamic> json){
    return FeesModel(
        id: json['id'],
        type: json['type'],
        amount: json['amount'],
        schoolClass: json["schoolClass"] != null ? SchoolClassModel.fromJson(json['schoolClass']) : null
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}
