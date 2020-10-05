import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ExamsState extends Equatable {
  ExamsState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ExamsEmptyState extends ExamsState {}

class ExamsLoadedState extends ExamsState {
  final ExamsPageData examsPageData;

  ExamsLoadedState({this.examsPageData});

  @override
  // TODO: implement props
  List<Object> get props => [examsPageData];
}

class ExamsLoadingState extends ExamsState {}

class ExamsErrorState extends ExamsState {}