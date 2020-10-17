import 'package:equatable/equatable.dart';

abstract class AddAssignmentEvent extends Equatable {
  AddAssignmentEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ClassDropdownEvent extends AddAssignmentEvent {
  final String classId;
  final String teacherId;

  ClassDropdownEvent({this.teacherId, this.classId});
  @override
  // TODO: implement props
  List<Object> get props => [classId, teacherId];
}
