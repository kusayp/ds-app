import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/exceptions/api-exceptions.dart';
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
    // TODO: implement mapEventToState
    if(event is FetchingGroupsInClassEvent){
      yield ChatLoadingState();
      try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        final GroupPageData response = await repository.getGroupsInClass(schoolId, event.classId, event.userId);
        yield ChatLoadedState(groupPageData: response, classId: event.classId);
      }
      on ApiException catch(e){
        yield ChatErrorState(e.getMessage());
      }
    }

    if(event is FetchingUsersInGroupsEvent){
      yield ChatLoadingState();
      try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        final List<UserModel> response = await repository.getUserInGroups(schoolId, event.group.classId, event.group.id);
        yield UsersLoadedState(users: response);
      }
      on ApiException catch(e){
        yield ChatErrorState(e.getMessage());
      }
    }

    if (event is SendTextMessageEvent) {
      String userString = await sharedPreferences.getUserDetails();
      LoginResponse user = LoginResponse.fromJson(userString);
      ChatModel chatModel = ChatModel(
        title: "DS APP",
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        message: event.message,
        direction: Direction.OUT.index,
        toOrFrom: event.to.id,
      );
      Map<String, dynamic> data = {
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'title': "DS APP",
        'message': event.message,
        'toOrFrom': event.to,
        'timeStamp': DateTime.now().millisecondsSinceEpoch,
        'type': 'chat_message',
        'user': user.user.id,
        'token': event.to.token,
      };
      await repository.saveChat(chatModel, data);
//      FetchChatListEvent();
      yield ChatEmptyState();
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

//  PushNotificationService().sendAndRetrieveMessage("cyLrlauUQvykx3ASMBGa6z:APA91bEh4Cqbg7DSBzZY9eImWPxNBi3oXkeuraiEoANiBy1moLQz_061M-T3U94dFaPzVeVeX2j8p25Zmb6hx6gDGwSmrBNy0pd32z57AN_vRgQ16zcRp7pViaGFNgbB5JULkU_DSdsn", "DS APP", textEditingController.text, Map<String, dynamic>());

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