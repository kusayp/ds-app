import 'package:dsapp/models/models.dart';

class AnswerModel {
  final int id;
  final String description;
  final AssignmentModel assignment;
  final List<String> attachments;
  final UserModel student;

  AnswerModel({this.id, this.description, this.assignment, this.attachments, this.student});

  static AnswerModel fromJson(Map<String, dynamic> json){
    var attachmentsFromJson = json['attachments'] as List;
    List<String> downloadUrlsList = json['attachments'] != null ? new List<String>.from(attachmentsFromJson) : [];
    return AnswerModel(
      id: json["id"],
      description: json["description"],
      attachments: downloadUrlsList,
      assignment: AssignmentModel.fromJson(json["assignment"]),
      student: UserModel.fromJson(json["student"])
    );
  }

}

class AddAnswerModel {
  final String description;
  final int student;
  final List<String> attachments;

  AddAnswerModel({this.description, this.student, this.attachments});

  static Map<String, dynamic> toJson(AddAnswerModel answerModel) => {
    'student': answerModel.student,
    'description': answerModel.description != null ? answerModel.description : null,
    'attachment': answerModel.attachments,
  };
}