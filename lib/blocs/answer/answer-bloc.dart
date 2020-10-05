import 'package:bloc/bloc.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class AnswerBloc extends Bloc<AnswerEvent, AnswerState> {
  final AssignmentRepository repository;
  AnswerBloc({this.repository}) : super(AnswerEmptyState());

  @override
  void onTransition(Transition<AnswerEvent, AnswerState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<AnswerState> mapEventToState(AnswerEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    // TODO: implement mapEventToState
    if(event is FetchingAnswerEvent){
      yield AnswerLoadingState();
      try{
//        String user = await sharedPreferences.getUserDetails();
//        LoginResponse loginResponse = LoginResponse.fromJson(user);
//        var schoolId = loginResponse.schools.single.id;
        var role = await sharedPreferences.getSharedPreference("role");
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        print(schoolId);
        final AnswerPageData response = await repository.getAnswers(schoolId, event.assignmentId);
        print(response);
        yield AnswerLoadedState(answerPageData: response);
      }
      catch(_){
        yield AnswerErrorState();
      }
    }
  }

}