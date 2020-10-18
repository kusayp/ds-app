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