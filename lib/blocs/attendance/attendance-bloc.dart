import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AttendanceRepository repository;
  AttendanceBloc({this.repository}) : super(AttendanceEmptyState());

  @override
  void onTransition(Transition<AttendanceEvent, AttendanceState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<AttendanceState> mapEventToState(AttendanceEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    if(event is TodayAttendanceEvent){
      yield AttendanceLoadingState();
      try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        if (event.classId == null){
          yield AttendanceErrorState("User does not belong to a class");
        }else{
        final ClassRegisterPageData response = await repository.getAttendance(schoolId, event.classId, event.actorId);
        yield AttendanceLoadedState(classRegisterPageData: response);
        }
      }
      on ApiException catch(_){
        yield AttendanceErrorState(_.getMessage());
      }
      on SocketException catch(_){
        yield AttendanceErrorState("No internet connection");
      }
    }
  }

}