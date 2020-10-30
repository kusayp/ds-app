import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

class GroupModel extends Equatable{
  final int id;
//  final UserModel teacher;
  final SubjectModel subject;
  final int limit;
  final String name;
  final String classId;

  GroupModel({this.id, this.subject, this.limit, this.name, this.classId});

  static GroupModel fromJson(Map<String, dynamic> json){
    return GroupModel(
      id: json['id'],
//      teacher: UserModel.fromJson(json['teacher']),
      subject: SubjectModel.fromJson(json['subject']),
      limit: json['limit'],
      name: json['name'],
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];


}