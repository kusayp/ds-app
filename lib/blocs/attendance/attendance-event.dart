import 'package:equatable/equatable.dart';

abstract class AttendanceEvent extends Equatable {
  AttendanceEvent();

  @override
  List<Object> get props => [];
}

class TodayAttendanceEvent extends AttendanceEvent {
  final String actorId;
  final String classId;
  TodayAttendanceEvent({this.actorId, this.classId});
  @override
  List<Object> get props => [actorId];
}

class WeekAttendanceEvent extends AttendanceEvent {
  WeekAttendanceEvent();
  @override
  List<Object> get props => [];
}