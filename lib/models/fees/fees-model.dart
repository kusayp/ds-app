import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

class FeesModel extends Equatable{
  final int id;
  final FeeType type;
  final double amount;
  final SchoolClassModel schoolClass;

  FeesModel({this.id, this.type, this.amount, this.schoolClass});

  static FeesModel fromJson(Map<String, dynamic> json){
    return FeesModel(
        id: json['id'],
        type: FeeType.fromJson(json['type']),
        amount: json['amount'],
        schoolClass: json["schoolClass"] != null ? SchoolClassModel.fromJson(json['schoolClass']) : null
    );
  }

  @override
  // TODO: implement props
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
  // TODO: implement props
  List<Object> get props => [];
}
