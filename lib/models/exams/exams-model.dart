import 'package:equatable/equatable.dart';
import 'package:dsapp/models/models.dart';

class ExamsModel extends Equatable{
  final int id;
  final ExamType type;
  final int startDate;
  final int endDate;
  final Term term;

  ExamsModel({this.id, this.type, this.startDate, this.endDate, this.term});

  static ExamsModel fromJson(Map<String, dynamic> json){
    return ExamsModel(
      id: json['id'],
      type: ExamType.fromJson(json['type']),
      startDate: json['startDate'],
      endDate: json['endDate'],
      term: Term.fromJson(json['term'])
    );
  }

  @override
  List<Object> get props => [];
}
