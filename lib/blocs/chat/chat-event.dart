import 'package:dsapp/models/chat/chat.dart';
import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  ChatEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchingGroupsInClassEvent extends ChatEvent {
  final String classId;
  FetchingGroupsInClassEvent({this.classId});
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchingUsersInGroupsEvent extends ChatEvent {
  final GroupModel group;
  FetchingUsersInGroupsEvent({this.group});
  @override
  // TODO: implement props
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
  final int to;

  SendTextMessageEvent({this.message, this.to}) : super();

  @override
  String toString() => 'SendTextMessageEvent';
}