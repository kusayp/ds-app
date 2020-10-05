import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class AssignmentState extends Equatable {
  AssignmentState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AssignmentEmptyState extends AssignmentState {}

class AssignmentLoadedState extends AssignmentState {
  final AssignmentPageData assignmentPageData;
  final String role;

  AssignmentLoadedState({this.assignmentPageData, this.role});

  @override
  // TODO: implement props
  List<Object> get props => [assignmentPageData];
}

class AssignmentLoadingState extends AssignmentState {}

class AssignmentErrorState extends AssignmentState {}