import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class ExamsBloc extends Bloc<ExamsEvent, ExamsState> {
  final ExamsRepository repository;
  ExamsBloc({this.repository}) : super(ExamsEmptyState());

  @override
  void onTransition(Transition<ExamsEvent, ExamsState> transition) {
    print(transition); super.onTransition(transition);
  }

  @override
  Stream<ExamsState> mapEventToState(ExamsEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    // TODO: implement mapEventToState
    if(event is FetchingExamsEvent){
      yield ExamsLoadingState();
      try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        final ExamsPageData response = await repository.getExams(schoolId);
        yield ExamsLoadedState(examsPageData: response);
      }
      on ApiException catch(e){
        yield ExamsErrorState(e.getMessage());
      }
    }
  }

}