import 'dart:io';

import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitAnswerScreen extends StatelessWidget {
  final AssignmentAnswerArguments arguments;

  const SubmitAnswerScreen({Key key, this.arguments}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String _filename;
    void viewSubmitAnswersPage() {
      BlocProvider.of<AnswerBloc>(context).add(AssignmentAnswerEvent(
          student: arguments.menuArguments.roleModules.user.id, description: "", attachment: "", assignmentId: arguments.assignment.id));
    }

    void openFileExplorer() async {
      FilePickerResult result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc'],
      );

      if(result != null) {
        File file = File(result.files.single.path);
        print(file.path);
//        setState(() {
//          _filename = result.files.single.name;
//          print(_filename);
//        });
      }
    }

    void _showSnackBar(String success, Color color) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(success),
        backgroundColor: color,
      ));
    }

    return SafeArea(
      child: BlocListener<AnswerBloc, AnswerState>(
        listener: (context, state) {
          if (state is AnswerErrorState){
            print(state.errorMessage);
//          context.hideLoaderOverlay();
            showDialog(
                context: context,
                builder: (_) => ErrorDialog(errorMessage: state.errorMessage,),
                barrierDismissible: false
            );
          }

          if (state is AnswerSavedState){
            _showSnackBar("Answer successfully submitted", Colors.green);
          }

        },
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: BlocBuilder<AnswerBloc, AnswerState>(
          builder: (context, state) {
            if(state is AnswerEmptyState){
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height *0.3,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AnswerAttachButton(
                        buttonText: "Choose File",
                        onButtonPressed: openFileExplorer,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height *0.02,),
                  Container(
                    height: MediaQuery.of(context).size.height *0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Addition and subtraction.pdf", style: ThemeText.menuDropDownText,),
                      ],
                    ),
                  ),
                  LoginButton(buttonText: "Submit", onButtonPressed: viewSubmitAnswersPage,)
                ],
              );
            }

            if (state is AnswerLoadingState){
//                context.showLoaderOverlay();
              return Center(child: Text("Loading...", style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,));
//                  return CircularProgressIndicator();
            }

            if (state is AnswerSavedState) {
              Future.delayed(Duration(milliseconds: 5), () => Navigator.pushNamedAndRemoveUntil(
                context,
                AnswerPage.routeName,  ModalRoute.withName(AssignmentDetailPage.routeName),
                arguments: arguments.assignment.id,
              ),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }
          ),
        ),
      ),
    );
  }
}
