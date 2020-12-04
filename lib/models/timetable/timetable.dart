import 'package:dsapp/models/users/user-model.dart';
import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

class TimeTableModel extends Equatable{
  final int id;
  final SubjectModel subject;
  final SchoolClassModel schoolClass;
  final ClassRoomModel classRoom;
  final UserModel teacher;
  final String day;
  final String startTime;
  final String endTime;

  TimeTableModel({this.id, this.subject, this.schoolClass, this.classRoom, this.teacher, this.day, this.startTime, this.endTime});

  @override
  List<Object> get props => [];

  static TimeTableModel fromJson(Map<String, dynamic> json){
    return TimeTableModel(
      id: json['id'],
      subject: SubjectModel.fromJson(json['subject']),
      schoolClass: json.containsKey('schoolClass') ? SchoolClassModel.fromJson(json['schoolClass']) : null,
      classRoom: ClassRoomModel.fromJson(json['classRoom']),
      teacher: json.containsKey('teacher') ? UserModel.fromJson(json['teacher']) : null,
      day: json['day'],
      startTime: json['startTime'],
      endTime: json['endTime']
    );
  }
}