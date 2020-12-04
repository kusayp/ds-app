import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class AssignmentDetailState extends Equatable {
  AssignmentDetailState();
  @override
  List<Object> get props => [];
}

class AssignmentDetailEmptyState extends AssignmentDetailState {}

class AssignmentDetailLoadedState extends AssignmentDetailState {
  final AssignmentModel assignmentModel;

  AssignmentDetailLoadedState({this.assignmentModel});

  @override
  List<Object> get props => [assignmentModel];
}

class AssignmentDetailLoadingState extends AssignmentDetailState {}

class AssignmentDetailErrorState extends AssignmentDetailState {}