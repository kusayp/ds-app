import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
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
    // TODO: implement mapEventToState
    if(event is TodayAttendanceEvent){
      yield AttendanceLoadingState();
      try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        final ClassRegisterPageData response = await repository.getAttendance(schoolId, event.classId, event.actorId);
        yield AttendanceLoadedState(classRegisterPageData: response);
      }
      catch(_){
        yield AttendanceErrorState();
      }
    }
  }

}