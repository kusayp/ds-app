import 'package:equatable/equatable.dart';

class ExamType extends Equatable{
  final int id;
  final String name;

  ExamType({this.id, this.name});

  static ExamType fromJson(Map<String, dynamic> json){
    return ExamType(
        id: json['id'],
        name: json['name']
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}