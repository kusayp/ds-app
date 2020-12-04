import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AssignmentModel extends Equatable{
  final int id;
  final String title;
  final String description;
  final SubjectModel subject;
  final SchoolClassModel schoolClass;
  final int dueDate;
  final UserModel teacher;
  final List<dynamic> attachments;
  List<String> downloadUrls;

  AssignmentModel({this.id, this.title, this.description, this.subject, this.schoolClass, this.dueDate, this.teacher, this.attachments, this.downloadUrls});

  set setDownloadUrls(List<String> downloadUrls) {
    this.downloadUrls = downloadUrls;
  }

  static AssignmentModel fromJson(Map<String, dynamic> json){
    return AssignmentModel(
        id: json['id'],
        subject: json.containsKey("subject") ?  SubjectModel.fromJson(json['subject']) : null,
        schoolClass: json.containsKey("schoolClass") ? SchoolClassModel.fromJson(json['schoolClass']) : null,
        dueDate: json['dueDate'],
        teacher: json.containsKey("teacher") ? UserModel.fromJson(json['teacher']) : null,
        title: json['title'],
        description: json['description'],
        attachments: json['attachments']
    );
  }

  static Map<String, dynamic> toJson(AssignmentModel assignmentModel) => {
    'id': assignmentModel.id,
    'name': assignmentModel.title,
    'subject': assignmentModel.subject != null ? SubjectModel.toJson(assignmentModel.subject) : null,
  };

  @override
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
  final List<String> attachments;

  AddAssignmentModel({this.id, this.title, this.description, this.subject, this.schoolClass, this.dueDate, this.teacher, this.attachments});

  static Map<String, dynamic> toJson(AddAssignmentModel assignmentModel) => {
    'id': assignmentModel.id,
    'title': assignmentModel.title,
    'subject': assignmentModel.subject,
    'schoolClass': assignmentModel.schoolClass,
    'teacher': assignmentModel.teacher,
    'dueDate': assignmentModel.dueDate,
    'description': assignmentModel.description != null ? assignmentModel.description : null,
    'attachments': assignmentModel.attachments,
  };
}