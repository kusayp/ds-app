import 'package:equatable/equatable.dart';

abstract class AssignmentEvent extends Equatable {
  AssignmentEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchingAssignmentEvent extends AssignmentEvent {
  final String schoolId;
  final String classId;
  final String teacherId;

  FetchingAssignmentEvent({this.teacherId, this.classId, this.schoolId});
  @override
  // TODO: implement props
  List<Object> get props => [classId, teacherId, schoolId];
}
