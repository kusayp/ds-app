import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ClassRegisterEvent extends Equatable {
  ClassRegisterEvent();

  @override
  List<Object> get props => [];
}

class ClassRegisterFilterByScheduleEvent extends ClassRegisterEvent {
  final String classId;
  final TimeTableModel tableModel;
  ClassRegisterFilterByScheduleEvent({this.classId, this.tableModel});
  @override
  List<Object> get props => [classId, tableModel];
}

class SchoolClassDropdownEventEvent extends ClassRegisterEvent {
  final String classId;
  SchoolClassDropdownEventEvent({this.classId});
  @override
  List<Object> get props => [];
}

class ScheduleDropdownEventEvent extends ClassRegisterEvent {
  final String classId;
  ScheduleDropdownEventEvent({this.classId});
  @override
  List<Object> get props => [];
}

class ToggleClassRegisterEvent extends ClassRegisterEvent {
  final int userId;
  final bool isPresent;

  ToggleClassRegisterEvent({this.userId, this.isPresent});
  @override
  List<Object> get props => [];
}

class SaveClassRegisterEvent extends ClassRegisterEvent {
  final int userId;
  final bool isPresent;

  SaveClassRegisterEvent({this.userId, this.isPresent});

  @override
  List<Object> get props => [];
}

// class ClassRegisterLoadedEvent extends ClassRegisterEvent {
//   final int userId;
//   final bool isPresent;
//
//   SaveClassRegisterEvent({this.userId, this.isPresent});
//   @override
//   List<Object> get props => [];
// }
