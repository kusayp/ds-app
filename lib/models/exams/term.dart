import 'package:equatable/equatable.dart';

class Term extends Equatable{
  final int id;
  final String name;
  final int startDate;
  final int endDate;

  Term({this.id, this.name, this.startDate, this.endDate});

  static Term fromJson(Map<String, dynamic> json){
    return Term(
        id: json['id'],
        name: json['name'],
        startDate: json['startDate'],
        endDate: json['endDate']
    );
  }

  @override
  List<Object> get props => [];
}