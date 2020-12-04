import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/exceptions/api-exceptions.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository repository;
//  StreamSubscription messagesSubscription;
  StreamSubscription chatsSubscription;
  ChatBloc({this.repository}) : super(ChatEmptyState());

  @override
  void onTransition(Transition<ChatEvent, ChatState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    if(event is FetchingGroupsInClassEvent){
      yield ChatLoadingState();
      try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        if (event.classId == null){
          yield ChatErrorState("User does not belong to a class");
        }
        else{
        final GroupPageData response = await repository.getGroupsInClass(schoolId, event.classId, event.userId);
        yield ChatLoadedState(groupPageData: response, classId: event.classId);
        }
      }
      on ApiException catch(e){
        yield ChatErrorState(e.getMessage());
      }
    }

    if(event is FetchingUsersInGroupsEvent){
      yield ChatLoadingState();
      try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        var userId = await sharedPreferences.getSharedPreference("userId");
        List<UserModel> users = [];
        final List<UserModel> response = await repository.getUserInGroups(schoolId, event.group.classId, event.group.id);
        response.removeWhere((element) => element.id.toString() == userId);
        for(var i=0; i<response.length; i++){
          if(response[i].deviceId != null){
            users.add(response[i]);
          }
        }
        yield UsersLoadedState(users: users);
      }
      on ApiException catch(e){
        yield ChatErrorState(e.getMessage());
      }
    }

    if (event is SendTextMessageEvent) {
      yield ChatSendingState();
      try{
        String userString = await sharedPreferences.getSharedPreference("user");
        LoginResponse user = LoginResponse.fromJson(userString);
        ChatModel chatModel = ChatModel(
          title: S().appName,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
          message: event.message,
          direction: Direction.OUT.index,
          toOrFrom: event.to.id,
        );

        Map<String, dynamic> data = {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'title': S().appName,
          'message': event.message,
          'toOrFrom': event.to.id,
          'timeStamp': DateTime.now().millisecondsSinceEpoch,
          'type': 'chat_message',
          'user': user.user.id,
          'token': event.to.deviceId,
        };

        await repository.saveChat(chatModel, data);

        yield ChatEmptyState();
      }
      on ApiException catch(e){
        yield ChatErrorState(e.getMessage());
      }
      on SocketException catch(_){
        yield ChatErrorState("No internet connection");
      }
    }

    if (event is FetchChatListEvent) {
      List<ChatModel> chats = await repository.getChatsFromDb(event.toOrFrom);
//      yield* mapFetchChatListEventToState(event);
      yield FetchedChatListState(chatList: chats);
    }

    if (event is ReceivedChatsEvent) {
      print(event.chatList);
      yield FetchedChatListState(chatList: event.chatList);
    }
  }

  Stream<ChatState> mapFetchChatListEventToState(
      FetchChatListEvent event) async* {
    try {
      chatsSubscription?.cancel();
      chatsSubscription = repository
          .getChatsFromDb(event.toOrFrom)
          .then((chats) => add(ReceivedChatsEvent(chats))) as StreamSubscription;
    } on ApiException catch (exception) {
      print(exception);
      yield ChatErrorState(exception.getMessage());
    }
  }
}