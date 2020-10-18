import 'package:dsapp/models/models.dart';

class AnswerModel {
  final int id;
  final String description;
  final AssignmentModel assignment;
  final String attachment;
  final UserModel student;

  AnswerModel({this.id, this.description, this.assignment, this.attachment, this.student});

  static AnswerModel fromJson(Map<String, dynamic> json){
    return AnswerModel(
      id: json["id"],
      description: json["description"],
      attachment: json["attachment"] ?? "",
      assignment: AssignmentModel.fromJson(json["assignment"]),
      student: UserModel.fromJson(json["student"])
    );
  }

}

class AddAnswerModel {
  final String description;
  final int student;
  final String attachment;

  AddAnswerModel({this.description, this.student, this.attachment});

  static Map<String, dynamic> toJson(AddAnswerModel answerModel) => {
    'student': answerModel.student,
    'description': answerModel.description != null ? answerModel.description : null,
    'attachment': answerModel.attachment,
  };
}