import 'package:cloud_firestore/cloud_firestore.dart';
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
  final Stream<QuerySnapshot> chatList;
  final int userId;

  FetchedChatListState({this.chatList, this.userId}) : super();

  @override
  String toString() => 'FetchedChatListState';
}