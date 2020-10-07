import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

class ExamScoreModel extends Equatable{
  final int id;
  final UserModel student;
  final SubjectModel subject;
  final SchoolClassModel schoolClass;
  final ExamType type;
  final double mark;
  final int date;
  final Term term;

  ExamScoreModel({this.id, this.student, this.subject, this.schoolClass, this.type, this.mark, this.date, this.term});

  static ExamScoreModel fromJson(Map<String, dynamic> json){
    return ExamScoreModel(
        id: json['id'],
        student: UserModel.fromJson(json['student']),
        subject: SubjectModel.fromJson(json['subject']),
        schoolClass: SchoolClassModel.fromJson(json['schoolClass']),
        type: ExamType.fromJson(json['type']),
        mark: json['mark'],
        date: json['date'],
        term: Term.fromJson(json['term'])
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}