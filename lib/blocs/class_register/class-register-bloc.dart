import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class ClassRegisterBloc extends Bloc<ClassRegisterEvent, ClassRegisterState> {
  final ClassRegisterRepository repository;
  List<UserModel> users;
  List<UserModel> students;
  List<TimeTableModel> schedules;
  TimeTableModel selectedSchedule;
  String selectedSchoolClass;
  ClassRegisterBloc({this.repository}) : super(ClassRegisterEmptyState());

  @override
  void onTransition(Transition<ClassRegisterEvent, ClassRegisterState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<ClassRegisterState> mapEventToState(ClassRegisterEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    // TODO: implement mapEventToState
    if(event is ClassRegisterFilterByScheduleEvent){
      yield ClassRegisterLoadingState();
      List<UserModel> classUsers = [];
      try{
        final List<TimeTableModel> response = schedules;
        var subject = event.tableModel;
        classUsers.insert(0, subject.teacher);
        classUsers.insertAll(1, students);

        yield ClassRegisterLoadedState(schedules : response, users: classUsers, selectedSchedules: subject, selectedSchoolClass: event.classId, timeStamp: DateTime.now().millisecondsSinceEpoch);
      }
      catch(_){
        yield ClassRegisterErrorState();
      }
    }

    if(event is SchoolClassDropdownEventEvent){
      yield ClassRegisterLoadingState();
      List<UserModel> classUsers = [];
      try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        final TimeTablePageData response = await repository.getSchedules(schoolId, event.classId);
        var subject = response.result[0];
        final UserModelPageData studentsList = await repository.getClassActors(schoolId, event.classId, 'students');
        classUsers.insert(0, subject.teacher);
        classUsers.insertAll(1, studentsList.result);
        this.students = studentsList.result;
        this.users = classUsers;
        this.schedules = response.result;
        this.selectedSchedule = subject;
        yield ClassRegisterLoadedState(schedules : response.result, users: classUsers, selectedSchedules: subject, selectedSchoolClass: event.classId);
      }
      catch(_){
        yield ClassRegisterErrorState();
      }
    }

//    if(event is ScheduleDropdownEventEvent){
//      yield ClassRegisterLoadingState();
//      List<UserModel> classUsers = [];
//      try{
//        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
//        final TimeTablePageData response = await repository.getSchedules(schoolId, event.classId);
//        var subject = response.result[0];
//        classUsers.insert(0, subject.teacher);
//        classUsers.insertAll(1, studentsList.result);
//        this.users = classUsers;
//        this.schedules = response.result;
//        this.selectedSchedule = subject;
//        yield ClassRegisterLoadedState(schedules : response.result, users: classUsers, selectedSchedules: subject);
//      }
//      catch(_){
//        yield ClassRegisterErrorState();
//      }
//    }

    if(event is ToggleClassRegisterEvent){
      for(var i = 0; i < users.length; i++){
        if(users[i].id == event.userId){
          users[i].isPresent = event.isPresent;
          break;
        }
      }
      yield ClassRegisterToggledState(users: users, schedules: schedules, selectedSchedules: selectedSchedule, timeStamp: DateTime.now().millisecondsSinceEpoch);
    }

    if(event is SaveClassRegisterEvent){
      yield ClassRegisterLoadingState();
      try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        var user = users;
        var schedule = selectedSchedule;
        for(var i = 0; i < user.length; i ++){

          await repository.saveClassRegister(schoolId, schedule.id.toString(), user[i].id.toString(), user[i].isPresent);
        }
        yield ClassRegisterSavedState();
      }
      catch(_){

      }

    }
  }

}