import 'package:bloc/bloc.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class AssignmentBloc extends Bloc<AssignmentEvent, AssignmentState> {
  final AssignmentRepository repository;
  AssignmentBloc({this.repository}) : super(AssignmentEmptyState());

  @override
  void onTransition(Transition<AssignmentEvent, AssignmentState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<AssignmentState> mapEventToState(AssignmentEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    // TODO: implement mapEventToState
    if(event is FetchingAssignmentEvent){
      yield AssignmentLoadingState();
      try{
//        String user = await sharedPreferences.getUserDetails();
        var role = await sharedPreferences.getSharedPreference("role");
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        print(schoolId);
//        LoginResponse loginResponse = LoginResponse.fromJson(user);
//        var schoolId = loginResponse.schools.single.id;
        final AssignmentPageData response = await repository.getAssignments(schoolId);
        yield AssignmentLoadedState(assignmentPageData: response, role: role);
      }
      catch(_){
        yield AssignmentErrorState();
      }
    }
  }

}