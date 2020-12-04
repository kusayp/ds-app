import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {
  ChatState();
  @override
  List<Object> get props => [];
}

class ChatEmptyState extends ChatState {}

class ChatLoadedState extends ChatState {
  final GroupPageData groupPageData;
  final String classId;

  ChatLoadedState({this.groupPageData, this.classId});

  @override
  List<Object> get props => [groupPageData];
}

class UsersLoadedState extends ChatState {
  final List<UserModel> users;

  UsersLoadedState({this.users});

  @override
  List<Object> get props => [users];
}

class ChatLoadingState extends ChatState {}

class ChatSendingState extends ChatState {}

class ChatSentState extends ChatState {}

class ChatErrorState extends ChatState {
  final String error;

  ChatErrorState(this.error);
}

class FetchedChatListState extends ChatState {
  final List<ChatModel> chatList;

  FetchedChatListState({this.chatList}) : super();

  @override
  String toString() => 'FetchedChatListState';
}