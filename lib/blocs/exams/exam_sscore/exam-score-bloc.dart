import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class ExamScoreBloc extends Bloc<ExamScoreEvent, ExamScoreState> {
  final ExamsRepository repository;
  ExamScoreBloc({this.repository}) : super(ExamScoreInitialState());

  @override
  void onTransition(Transition<ExamScoreEvent, ExamScoreState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<ExamScoreState> mapEventToState(ExamScoreEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    // TODO: implement mapEventToState
    if(event is FetchingExamScoreEvent){
      yield ExamScoreLoadingState();
      try{
        String user = await sharedPreferences.getUserDetails();
        LoginResponse loginResponse = LoginResponse.fromJson(user);
//        var role = await sharedPreferences.getSharedPreference("role");
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        final ExamScorePageData response = await repository.getExamScores(schoolId, event.examinationId, loginResponse.user.id);
        if (response.results.isEmpty){
          yield ExamScoreEmptyState();
        }else{
          yield ExamScoreLoadedState(examScorePageData: response);
        }
      }
      on ApiException catch(e){
        yield ExamScoreErrorState(e.getMessage());
      }
    }
  }

}