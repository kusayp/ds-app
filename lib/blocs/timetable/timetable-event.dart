import 'package:equatable/equatable.dart';

abstract class TimeTableEvent extends Equatable {
  const TimeTableEvent();
}

class GetDaySelected extends TimeTableEvent {
  final String day;

  GetDaySelected({this.day});

  @override
  List<Object> get props => [];
}

class GetTimeTableFromDayEvent extends TimeTableEvent {
  final String day;
  final String classId;
  final String teacherId;

  GetTimeTableFromDayEvent({this.day, this.classId, this.teacherId});

  @override
  List<Object> get props => [day, classId, teacherId];
}
