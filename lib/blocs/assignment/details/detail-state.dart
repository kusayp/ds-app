import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class AssignmentDetailState extends Equatable {
  AssignmentDetailState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AssignmentDetailEmptyState extends AssignmentDetailState {}

class AssignmentDetailLoadedState extends AssignmentDetailState {
  final AssignmentPageData assignmentPageData;

  AssignmentDetailLoadedState({this.assignmentPageData});

  @override
  // TODO: implement props
  List<Object> get props => [assignmentPageData];
}

class AssignmentDetailLoadingState extends AssignmentDetailState {}

class AssignmentDetailErrorState extends AssignmentDetailState {}