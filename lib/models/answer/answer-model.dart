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