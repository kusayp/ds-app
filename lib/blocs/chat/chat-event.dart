import 'package:dsapp/models/chat/chat.dart';
import 'package:dsapp/models/users/user-model.dart';
import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  ChatEvent();

  @override
  List<Object> get props => [];
}

class FetchingGroupsInClassEvent extends ChatEvent {
  final String classId;
  final String userId;
  final String filter;
  FetchingGroupsInClassEvent({this.classId, this.userId, this.filter});
  @override
  List<Object> get props => [];
}

class FetchingUsersInGroupsEvent extends ChatEvent {
  final GroupModel group;
  FetchingUsersInGroupsEvent({this.group});
  @override
  List<Object> get props => [];
}

class FetchChatListEvent extends ChatEvent {
  final int toOrFrom;

  FetchChatListEvent(this.toOrFrom);
  @override
  String toString() => 'FetchChatListEvent';
}

//triggered when stream containing list of chats has new data
class ReceivedChatsEvent extends ChatEvent {
  final List<ChatModel> chatList;

  ReceivedChatsEvent(this.chatList);

  @override
  String toString() => 'ReceivedChatsEvent';
}

//triggered to send new text message
class SendTextMessageEvent extends ChatEvent {
  final String message;
  final UserModel to;

  SendTextMessageEvent({this.message, this.to}) : super();

  @override
  String toString() => 'SendTextMessageEvent';
}