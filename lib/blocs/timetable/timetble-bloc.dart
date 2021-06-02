import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class TimeTableBloc extends Bloc<TimeTableEvent, TimeTableState> {
  final TimeTableRepository repository;
  LocalStorage sharedPreferences = LocalStorage();

  TimeTableBloc({this.repository}) : super(TimeTableEmpty());

  @override
  Stream<TimeTableState> mapEventToState(TimeTableEvent event) async* {
    if (event is GetTimeTableFromDayEvent) {
      yield TimeTableLoading();
      try {
        TimeTablePageData response = TimeTablePageData();
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        var role = await sharedPreferences.getSharedPreference("role");
        if (role == "ENSEINGNANT") {
          response = await repository.getSchedulesFilterByDay(
              schoolId, event.day, event.teacherId);
        } else {
          response = await repository.getSchedulesFilterByClass(
              schoolId, event.day, event.classId);
        }
        yield TimeTableLoaded(response: response, selectedDay: event.day);
      } on ApiException catch (e) {
        yield TimeTableError(e.getMessage());
      } on SocketException catch (_) {
        yield TimeTableError("No internet connection");
      }
    }
    // if (event is GetDaySelected) {
    //   yield DaySelectedState(day: event.day);
    // }
    //
    // if (event is GetTimeTableFromDayEvent) {
    //   yield* _mapClassSchedulesToState(event);
    // }
    // else if (event is NewCarBrandChanged) {
    //   yield* _mapNewCarBrandChangedToState(event, state);
    // } else if (event is NewCarModelChanged) {
    //   yield* _mapNewCarModelChangedToState(event, state);
    // } else if (event is NewCarYearChanged) {
    //   yield _mapNewCarYearChangedToState(event);
    // }
  }

// Stream<TimeTableState> _mapClassSchedulesToState(
//     GetTimeTableFromDayEvent event) async* {
//   yield TimeTableLoading();
//   try {
//     TimeTablePageData response = TimeTablePageData();
//     var schoolId = await sharedPreferences.getSharedPreference("schoolId");
//     var role = await sharedPreferences.getSharedPreference("role");
//     if (role == "ENSEINGNANT") {
//       response = await repository.getSchedulesFilterByDay(
//           schoolId, event.day, event.teacherId);
//     } else {
//       response = await repository.getSchedulesFilterByClass(
//           schoolId, event.day, event.classId);
//     }
//     yield TimeTableLoaded(response: response, selectedDay: event.day);
//   } on ApiException catch (e) {
//     yield TimeTableError(e.getMessage());
//   } on SocketException catch (_) {
//     yield TimeTableError("No internet connection");
//   }
// }
}
