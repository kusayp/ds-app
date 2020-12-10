import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:file_picker/file_picker.dart';
import 'package:uuid/uuid.dart';

class AnswerBloc extends Bloc<AnswerEvent, AnswerState> {
  final AssignmentRepository repository;
  AnswerBloc({this.repository}) : super(AnswerEmptyState());

  @override
  void onTransition(Transition<AnswerEvent, AnswerState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<AnswerState> mapEventToState(AnswerEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    String signedUrl;
    List<String> uuid = [];
    if(event is FetchingAnswerEvent){
      yield AnswerLoadingState();
      try{
        var role = await sharedPreferences.getSharedPreference("role");
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        print(schoolId);
        final AnswerPageData response = await repository.getAnswers(schoolId, event.assignmentId);
        print(response);
        yield AnswerLoadedState(answerPageData: response, role: role);
      }
      on ApiException catch(e){
        yield AnswerErrorState(e.getMessage());
      }
      on SocketException catch(_){
        yield AnswerErrorState("No internet connection");
      }
    }

    if(event is AssignmentAnswerEvent){
      yield AnswerLoadingState();
      try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        if (event.file != null){
          var objectKey = Uuid().v1() + ".${event.file.extension}";
          signedUrl = await repository.getSignedUrl(objectKey);
          String downloadUrl = signedUrl.split("?")[0];
          print(downloadUrl);
          uuid.add(downloadUrl);
          var file = File(event.file.path);
          await repository.uploadToS3WithSignedUrl(signedUrl, await file.readAsBytes());
        }
        AddAnswerModel answerModel = AddAnswerModel(
          student: event.student,
          description: event.description,
          attachments: uuid,
        );
        Map<String, dynamic> data = AddAnswerModel.toJson(answerModel);
        await repository.saveAnswer(schoolId, event.assignmentId, data);
        yield AnswerSavedState();
      }
      on ApiException catch(e){
        yield AnswerErrorState(e.getMessage());
      }
      on SocketException catch(_){
        yield AnswerErrorState("No internet connection");
      }
    }

    if(event is AnswerFileEvent){
      try{
        FilePickerResult result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf', 'docx', 'doc'],
        );

        if(result != null) {
          PlatformFile file = result.files.single;
          print(file.path);
          List<File> files = result.files.map((path) => File(path.path)).toList();
//        List<String> file = result.files.map((e) => e.name).toList();
          print(result.files.single.extension);
        }
      }
      on ApiException catch(e){
        yield AnswerErrorState(e.getMessage());
      }
    }
  }

}