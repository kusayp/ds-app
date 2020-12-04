import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dsapp/exceptions/exceptions.dart';
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
    if(event is FetchingAssignmentEvent){
      yield AssignmentLoadingState();
      try{
        var role = await sharedPreferences.getSharedPreference("role");
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        if (role == "ENSEINGNANT"){
          final AssignmentPageData response = await repository.getAssignmentsByTeacher(schoolId, event.teacherId);
          yield AssignmentLoadedState(assignmentPageData: response, role: role);
        }
        else{
          var schoolClassId = await sharedPreferences.getSharedPreference("schoolClassId");
          final AssignmentPageData response = await repository.getAssignmentsClass(schoolId, schoolClassId);
          yield AssignmentLoadedState(assignmentPageData: response, role: role);
        }
      }
      on ApiException catch(e){
        yield AssignmentErrorState(e.getMessage());
      }

      on SocketException catch(e){
        yield NoConnectionState();
      }
    }
  }

}