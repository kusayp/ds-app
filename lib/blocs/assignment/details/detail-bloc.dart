import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:path_provider/path_provider.dart';

class AssignmentDetailBloc extends Bloc<AssignmentDetailEvent, AssignmentDetailState> {
  final AssignmentRepository repository;
  AssignmentDetailBloc({this.repository}) : super(AssignmentDetailEmptyState());

  @override
  void onTransition(Transition<AssignmentDetailEvent, AssignmentDetailState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<AssignmentDetailState> mapEventToState(AssignmentDetailEvent event) async* {
    List<String> downloadUrls = [];
    if(event is FetchingSignedUrlEvent){
      yield AssignmentDetailLoadingState();
      try{
        for(var i = 0; i <event.assignment.attachments.length; i++){
          final String response = await repository.getSignedFetchUrl(event.assignment.attachments[i]);

          downloadUrls.add(response);
        }
        AssignmentModel assignment = AssignmentModel(
          id: event.assignment.id,
          title: event.assignment.title,
          description: event.assignment.description,
          subject: event.assignment.subject,
          schoolClass: event.assignment.schoolClass,
          dueDate: event.assignment.dueDate,
          teacher: event.assignment.teacher,
          attachments: event.assignment.attachments,
          downloadUrls: downloadUrls
        );
        yield AssignmentDetailLoadedState(assignmentModel: assignment);
      }
      on ApiException catch(e){
        yield AssignmentDetailErrorState(e.getMessage());
      }
      on SocketException catch(_){
        yield AssignmentDetailErrorState("No internet connection");
      }
    }

    if(event is OpenFileEvent){
      yield AssignmentDetailLoadingState();
      try{
        String fileName = event.downloadUrl.split("/").last;
        Dio dio = Dio();
        Directory tempDir = await getTemporaryDirectory();
        String tempPath = "${tempDir.path}/$fileName";
        print(tempPath);
        await dio.download(event.downloadUrl, tempPath);
        yield AssignmentFileOpenedState(tempPath: tempPath);
      }
      on ApiException catch(e){
        yield AssignmentDetailErrorState(e.getMessage());
      }
      on SocketException catch(_){
        yield AssignmentDetailErrorState("No internet connection");
      }
    }
  }

}