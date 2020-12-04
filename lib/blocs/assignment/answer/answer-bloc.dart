import 'package:bloc/bloc.dart';
import 'package:dsapp/exceptions/exceptions.dart';
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
    if(event is FetchingAnswerEvent){
      yield AnswerLoadingState();
      try{
        var role = await sharedPreferences.getSharedPreference("role");
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        print(schoolId);
        final AnswerPageData response = await repository.getAnswers(schoolId, event.assignmentId);
        print(response);
        yield AnswerLoadedState(answerPageData: response, role: role);
      }
      on ApiException catch(e){
        yield AnswerErrorState(e.getMessage());
      }
    }

    if(event is AssignmentAnswerEvent){
      yield AnswerLoadingState();
      try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        AddAnswerModel answerModel = AddAnswerModel(
          student: event.student,
          description: event.description,
        );
        Map<String, dynamic> data = AddAnswerModel.toJson(answerModel);
        await repository.saveAnswer(schoolId, event.assignmentId, data);
        yield AnswerSavedState();
      }
      on ApiException catch(e){
        yield AnswerErrorState(e.getMessage());
      }
    }
  }

}