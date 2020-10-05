import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class TimeTableBloc extends Bloc<TimeTableEvent, TimeTableState> {
  final TimeTableRepository repository;

  TimeTableBloc({this.repository}) : super(TimeTableEmpty());

  @override
  TimeTableState get initialState => TimeTableEmpty();

  @override
  Stream<TimeTableState> mapEventToState(TimeTableEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    // TODO: implement mapEventToState
    if (event is GetTimeTableFromDayEvent) {
      yield TimeTableLoading();
      try{
//        String user = await sharedPreferences.getUserDetails();
//        LoginResponse loginResponse = LoginResponse.fromJson(user);
//        var schoolId = loginResponse.schools.single.id;
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        print(schoolId);
        final TimeTablePageData response = await repository.getSchedulesFilterByDay(schoolId , event.day);
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