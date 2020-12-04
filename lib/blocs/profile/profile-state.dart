import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  ProfileState();
  @override
  List<Object> get props => [];
}

class ProfileEmptyState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final ExamsPageData examsPageData;

  ProfileLoadedState({this.examsPageData});

  @override
  List<Object> get props => [examsPageData];
}

class ProfileLoadingState extends ProfileState {}

class ProfileErrorState extends ProfileState {}