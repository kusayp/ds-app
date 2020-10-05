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
      type: json['type'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      term: json['term']
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}
