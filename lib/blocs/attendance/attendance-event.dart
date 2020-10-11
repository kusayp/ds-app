import 'package:equatable/equatable.dart';

abstract class AttendanceEvent extends Equatable {
  AttendanceEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TodayAttendanceEvent extends AttendanceEvent {
  final String actorId;
  TodayAttendanceEvent({this.actorId});
  @override
  // TODO: implement props
  List<Object> get props => [actorId];
}

class WeekAttendanceEvent extends AttendanceEvent {
  WeekAttendanceEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}