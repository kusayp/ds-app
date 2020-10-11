import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class TimeTableBloc extends Bloc<TimeTableEvent, TimeTableState> {
  final TimeTableRepository repository;

  TimeTableBloc({this.repository}) : super(TimeTableEmpty());


  @override
  Stream<TimeTableState> mapEventToState(TimeTableEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    // TODO: implement mapEventToState
    if (event is GetTimeTableFromDayEvent) {
      yield TimeTableLoading();
      try{
        TimeTablePageData response = TimeTablePageData();
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        var role = await sharedPreferences.getSharedPreference("role");
        if(role == "ENSEINGNANT"){
          response = await repository.getSchedulesFilterByDay(schoolId , event.day , event.teacherId);
        }
//        else if(role == "APPRENANT"){
//          String schoolClassId = await sharedPreferences.getSharedPreference('schoolClassId');
//          response = await repository.getSchedulesFilterByClass(schoolId , event.day, schoolClassId);
//        }
        else{
          response = await repository.getSchedulesFilterByClass(schoolId , event.day, event.classId);
        }
        yield TimeTableLoaded(response: response, selectedDay: event.day);
      }
      catch(_){
        yield TimeTableError();
      }
    }
    if(event is GetDaySelected){
      yield DaySelectedState(day: event.day);
    }
  }

}