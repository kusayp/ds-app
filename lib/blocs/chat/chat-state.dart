import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {
  ChatState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ChatEmptyState extends ChatState {}

class ChatLoadedState extends ChatState {
  final GroupPageData groupPageData;
  final String classId;

  ChatLoadedState({this.groupPageData, this.classId});

  @override
  // TODO: implement props
  List<Object> get props => [groupPageData];
}

class UsersLoadedState extends ChatState {
  final List<UserModel> users;

  UsersLoadedState({this.users});

  @override
  // TODO: implement props
  List<Object> get props => [users];
}

class ChatLoadingState extends ChatState {}

class ChatErrorState extends ChatState {}