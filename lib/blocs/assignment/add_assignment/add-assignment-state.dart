import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class AddAssignmentState extends Equatable {
  AddAssignmentState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AddAssignmentEmptyState extends AddAssignmentState {}

class ClassTeacherSubjectLoadedState extends AddAssignmentState {
  final List<SubjectModel> subjects;

  ClassTeacherSubjectLoadedState({this.subjects});

  @override
  // TODO: implement props
  List<Object> get props => [subjects];
}

class AddAssignmentLoadingState extends AddAssignmentState {}

class AddAssignmentErrorState extends AddAssignmentState {}