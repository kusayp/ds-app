import 'package:equatable/equatable.dart';

abstract class AssignmentDetailEvent extends Equatable {
  AssignmentDetailEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchingAssignmentAnswersEvent extends AssignmentDetailEvent {
  FetchingAssignmentAnswersEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}