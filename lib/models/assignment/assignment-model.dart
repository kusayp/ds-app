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

  static Map<String, dynamic> toJson(AssignmentModel assignmentModel) => {
    'id': assignmentModel.id,
    'name': assignmentModel.title,
    'subject': assignmentModel.subject != null ? SubjectModel.toJson(assignmentModel.subject) : null,
//    'children': schoolModel.children.isNotEmpty ? schoolModel.children.map<Map<String, dynamic>>((e) => UserModel.toJson(e)).toList() : null,
//    'children': schoolModel.children.isNotEmpty ? schoolModel.children.map((e) => UserModel.toJson(e)).toList() : null,
//    'studentClass': schoolModel?.studentClass != null ? SchoolClassModel.toJson(schoolModel?.studentClass) : null,
//    'teacherClasses': schoolModel.teacherClasses.isNotEmpty ? schoolModel.teacherClasses.map((e) => SchoolClassModel.toJson(e)).toList() : null,
//    'logo': schoolModel.name,
//    'role': schoolModel.name,
  };

  @override
  // TODO: implement props
  List<Object> get props => [];


}

class AddAssignmentModel {
  final int id;
  final String title;
  final String description;
  final int subject;
  final int schoolClass;
  final int dueDate;
  final int teacher;
  final String attachment;

  AddAssignmentModel({this.id, this.title, this.description, this.subject, this.schoolClass, this.dueDate, this.teacher, this.attachment});

  static Map<String, dynamic> toJson(AddAssignmentModel assignmentModel) => {
    'id': assignmentModel.id,
    'title': assignmentModel.title,
    'subject': assignmentModel.subject,
    'schoolClass': assignmentModel.schoolClass,
    'teacher': assignmentModel.teacher,
    'dueDate': assignmentModel.dueDate,
    'description': assignmentModel.description != null ? assignmentModel.description : null,
    'attachment': assignmentModel.attachment,
  };
}