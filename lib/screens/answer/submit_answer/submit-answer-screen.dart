import 'dart:io';

import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class SubmitAnswerScreen extends StatefulWidget {
  final AssignmentAnswerArguments arguments;

  const SubmitAnswerScreen({Key key, this.arguments}) : super(key: key);

  @override
  _SubmitAnswerScreenState createState() => _SubmitAnswerScreenState();
}

class _SubmitAnswerScreenState extends State<SubmitAnswerScreen> {
  String _filename;
  PlatformFile _file;

  @override
  Widget build(BuildContext context) {
    void viewSubmitAnswersPage() {
      BlocProvider.of<AnswerBloc>(context).add(AssignmentAnswerEvent(
          student: widget.arguments.menuArguments.roleModules.user.id,
          description: "",
          file: _file,
          assignmentId: widget.arguments.assignment.id));
    }

    void openFileExplorer() async {
      FilePickerResult result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        PlatformFile file = result.files.single;
        List<String> fileNames = result.names;
        List<String> filePaths = result.paths;
        print(file.path);
        List<File> files = result.files.map((path) => File(path.path)).toList();
//        List<String> file = result.files.map((e) => e.name).toList();
        print(result.files.single.extension);
        setState(() {
          _filename = file.name;
          _file = file;
        });
      }
    }

    void goBack() {
      Navigator.pop(context);
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
          if (state is AnswerErrorState) {
            showDialog(
                context: context,
                builder: (_) => ErrorDialog(
                      errorMessage: state.errorMessage,
                      onButtonPressed: goBack,
                    ),
                barrierDismissible: false);
          }

          if (state is AnswerSavedState) {
            _showSnackBar(
                S.of(context).answerSuccessfullySubmitted, Colors.green);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child:
              BlocBuilder<AnswerBloc, AnswerState>(builder: (context, state) {
            if (state is AnswerLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is AnswerSavedState) {
              Future.delayed(
                Duration(milliseconds: 5),
                () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AnswerPage.routeName,
                  ModalRoute.withName(AssignmentDetailPage.routeName),
                  arguments: widget.arguments.assignment.id,
                ),
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AnswerAttachButton(
                      buttonText: S.of(context).chooseFile,
                      onButtonPressed: openFileExplorer,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: _filename != null
                      ? PDFView(
                          filePath: _file.path,
                          enableSwipe: true,
                          swipeHorizontal: true,
                          autoSpacing: false,
                          pageFling: true,
                          pageSnap: true,
                          fitPolicy: FitPolicy.BOTH,
                          preventLinkNavigation: false,
                        )
                      : SizedBox(),
                ),
                LoginButton(
                  buttonText: S.of(context).submit,
                  onButtonPressed: viewSubmitAnswersPage,
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

// Text(
// _filename,
// style: ThemeText.menuDropDownText,
// softWrap: true,
// ),
