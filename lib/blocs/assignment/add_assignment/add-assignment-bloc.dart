
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:uuid/uuid.dart';

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
    List<String> attachments = List<String>();
    String signedUrl;
    List<String> uuid = [];

    if(event is ClassAssignmentSaveEvent){
      yield AddAssignmentLoadingState();
     try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
//        for(var i = 0; i < event.file.length; i++){
//          print(event.file[i].uri);
//        }
       if (event.file != null){
         var objectKey = Uuid().v1() + ".${event.file.extension}";
         signedUrl = await repository.getSignedUrl(objectKey);
         String downloadUrl = signedUrl.split("?")[0];
         print(downloadUrl);
         uuid.add(downloadUrl);
         var file = File(event.file.path);
         await repository.uploadToS3WithSignedUrl(signedUrl, await file.readAsBytes());
       }
        int dueDate = event.dueDate.millisecondsSinceEpoch;
        AddAssignmentModel assignmentModel = AddAssignmentModel(
          title: event.title,
          subject: event.subjectId,
          schoolClass: event.classId,
          dueDate: dueDate,
          teacher: event.teacherId,
          description: event.description,
          attachments: uuid
        );
        Map<String, dynamic> data = AddAssignmentModel.toJson(assignmentModel);
        await repository.saveAssignment(schoolId, data);
        yield AssignmentSavedState();
      }
     on ApiException catch(e){
        yield AddAssignmentErrorState(e.getMessage());
      }
     on SocketException catch(e){
       yield AddAssignmentErrorState("No internet connection");
     }
    }
  }

}