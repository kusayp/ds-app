import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository repository;
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
        final GroupPageData response = await repository.getGroupsInClass(schoolId, event.classId);
        yield ChatLoadedState(groupPageData: response, classId: event.classId);
      }
      catch(_){
        yield ChatErrorState();
      }
    }

    if(event is FetchingUsersInGroupsEvent){
      yield ChatLoadingState();
      try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        final List<UserModel> response = await repository.getUserInGroups(schoolId, event.group.classId, event.group.id);
        yield UsersLoadedState(users: response);
      }
      catch(_){
        yield ChatErrorState();
      }
    }
  }

}