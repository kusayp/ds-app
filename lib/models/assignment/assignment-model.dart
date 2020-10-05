import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

class AssignmentModel extends Equatable{
  final int id;
  final String title;
  final String description;
  final SubjectModel subject;
  final SchoolClassModel schoolClass;
  final int dueDate;
  final UserModel teacher;
  final String attachment;

  AssignmentModel({this.id, this.title, this.description, this.subject, this.schoolClass, this.dueDate, this.teacher, this.attachment});

  static AssignmentModel fromJson(Map<String, dynamic> json){
    return AssignmentModel(
        id: json['id'],
        subject: json.containsKey("subject") ?  SubjectModel.fromJson(json['subject']) : null,
        schoolClass: json.containsKey("schoolClass") ? SchoolClassModel.fromJson(json['schoolClass']) : null,
        dueDate: json['dueDate'],
        teacher: json.containsKey("teacher") ? UserModel.fromJson(json['teacher']) : null,
        title: json['title'],
        description: json['description'],
        attachment: json['attachment']
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];


}