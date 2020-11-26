import 'package:bloc/bloc.dart';
import 'package:dsapp/exceptions/exceptions.dart';
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
    if(event is ClassAssignmentSaveEvent){
      yield AddAssignmentLoadingState();
     try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        int dueDate = event.dueDate.millisecondsSinceEpoch;
        AddAssignmentModel assignmentModel = AddAssignmentModel(
          title: event.title,
          subject: event.subjectId,
          schoolClass: event.classId,
          dueDate: dueDate,
          teacher: event.teacherId,
          description: event.description,
        );
        Map<String, dynamic> data = AddAssignmentModel.toJson(assignmentModel);
        await repository.saveAssignment(schoolId, data);
        yield AssignmentSavedState();
      }
     on ApiException catch(e){
        yield AddAssignmentErrorState(e.getMessage());
      }
    }
  }

}