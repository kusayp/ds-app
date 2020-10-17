import 'package:bloc/bloc.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class AddAssignmentBloc extends Bloc<AddAssignmentEvent, AddAssignmentState> {
  final AssignmentRepository repository;
  AddAssignmentBloc({this.repository}) : super(AddAssignmentEmptyState());

  @override
  void onTransition(Transition<AddAssignmentEvent, AddAssignmentState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<AddAssignmentState> mapEventToState(AddAssignmentEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    // TODO: implement mapEventToState
//    if(event is FetchingAssignmentEvent){
//     try{
//        var role = await sharedPreferences.getSharedPreference("role");
//        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
//        if (role == "ENSEINGNANT"){
//          final AssignmentPageData response = await repository.getAssignmentsByTeacher(schoolId, event.teacherId);
//          yield ClassTeacherSubjectLoadedState(subjects: response);
//        }
//        else{
//          var schoolClassId = await sharedPreferences.getSharedPreference("schoolClassId");
//          final AssignmentPageData response = await repository.getAssignmentsClass(schoolId, schoolClassId);
//          yield AssignmentLoadedState(assignmentPageData: response, role: role);
//        }
//      }
//      catch(_){
//        yield AssignmentErrorState();
//      }
//    }
  }

}