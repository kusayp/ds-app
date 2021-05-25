import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

class FeesModel extends Equatable{
  final int id;
  final FeeType type;
  final double amount;
  final SchoolClassModel schoolClass;
  final String status;

  FeesModel({
    this.id,
    this.type,
    this.amount,
    this.schoolClass,
    this.status,
  });

  static FeesModel fromJson(Map<String, dynamic> json) {
    return FeesModel(
        id: json['id'],
        type: FeeType.fromJson(json['type']),
        amount: json['amount'],
        schoolClass: json["schoolClass"] != null
            ? SchoolClassModel.fromJson(json['schoolClass'])
            : null);
  }

  @override
  List<Object> get props => [];
}

class FeeType extends Equatable {
  final String name;

  FeeType({this.name});

  static FeeType fromJson(Map<String, dynamic> json){
    return FeeType(
      name: json['name'],
    );
  }

  @override
  List<Object> get props => [];
}
