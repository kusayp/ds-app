import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

class ClassRegisterModel extends Equatable{
  final int id;
  final UserModel actor;
  final TimeTableModel schedule;
  final bool present;
  final String createdAt;

  ClassRegisterModel({this.id, this.actor, this.schedule, this.present, this.createdAt});

  static ClassRegisterModel fromJson(Map<String, dynamic> json){
    return ClassRegisterModel(
      id: json['id'],
      actor: UserModel.fromJson(json['actor']),
      schedule: TimeTableModel.fromJson(json['schedule']),
      present: json['present'],
      createdAt: json['createdAt']
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];


}