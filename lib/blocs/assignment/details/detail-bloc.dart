import 'package:bloc/bloc.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class AssignmentDetailBloc extends Bloc<AssignmentDetailEvent, AssignmentDetailState> {
  final AssignmentRepository repository;
  AssignmentDetailBloc({this.repository}) : super(AssignmentDetailEmptyState());

  @override
  void onTransition(Transition<AssignmentDetailEvent, AssignmentDetailState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<AssignmentDetailState> mapEventToState(AssignmentDetailEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    // TODO: implement mapEventToState
    if(event is FetchingAssignmentEvent){
      yield AssignmentDetailLoadingState();
      try{
        String user = await sharedPreferences.getUserDetails();
        LoginResponse loginResponse = LoginResponse.fromJson(user);
        var schoolId = loginResponse.schools.single.id;
        final AssignmentPageData response = await repository.getAssignments(schoolId);
        yield AssignmentDetailLoadedState(assignmentPageData: response);
      }
      catch(_){
        yield AssignmentDetailErrorState();
      }
    }
  }

}