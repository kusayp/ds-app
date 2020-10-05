import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class ExamsBloc extends Bloc<ExamsEvent, ExamsState> {
  final ExamsRepository repository;
  ExamsBloc({this.repository}) : super(ExamsEmptyState());

  @override
  void onTransition(Transition<ExamsEvent, ExamsState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<ExamsState> mapEventToState(ExamsEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    // TODO: implement mapEventToState
    if(event is FetchingAssignmentEvent){
      yield ExamsLoadingState();
      try{
        String user = await sharedPreferences.getUserDetails();
        LoginResponse loginResponse = LoginResponse.fromJson(user);
        var schoolId = loginResponse.schools.single.id;
        final ExamsPageData response = await repository.getExams(schoolId);
        yield ExamsLoadedState(examsPageData: response);
      }
      catch(_){
        yield ExamsErrorState();
      }
    }
  }

}