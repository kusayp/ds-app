import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/attendance/components/tab_indicator.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/common.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';


class AssignmentDetailScreen extends StatelessWidget {
  final AssignmentModel assignment;
  final MenuArguments role;

  AssignmentDetailScreen({this.assignment, this.role});

  @override
  Widget build(BuildContext context) {
    void viewAnswers() {
      Navigator.pushNamed(
        context,
        AnswerPage.routeName,
        arguments: assignment.id,
      );
    }

    void viewSubmitAnswersPage() {
      Navigator.pushNamed(
        context,
        SubmitAnswerPage.routeName,
        arguments: AssignmentAnswerArguments(
          assignment: assignment,
          menuArguments: role,
        ),
      );
    }

    void goBack(){
      Navigator.maybePop(context);
    }

    // Future<void> openFile(String downloadUrl) async {
    //
    //
    //
    // }

    List<Widget> buildAttachmentsWidget(List<String> downloadUrls) {
      final children = <Widget>[];

      for (int i = 0; i < downloadUrls.length; i++) {
        children.add(
            GestureDetector(
              onTap: () {
                BlocProvider.of<AssignmentDetailBloc>(context)
                        .add(OpenFileEvent(downloadUrl: downloadUrls[i]));
                // openFile(downloadUrls[i]);
              },
              child: Container(
                height: 40.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(downloadUrls[i] ?? S.of(context).noAttachment, style: TextStyle(decoration: TextDecoration.underline, color: appTheme().primaryColor)),
                  ),
                ),
              ),
            )
        );
      }
      return children;
    }

    final isTeacher = role.roleModules.role == "ENSEINGNANT";
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AssignmentDetailBloc, AssignmentDetailState>(
            listener: (context, state) {
              if(state is AssignmentDetailErrorState){
                showDialog(
                    context: context,
                    builder: (_) => ErrorDialog(
                      errorMessage: state.errorMessage,
                      onButtonPressed: goBack,
                    ),
                    barrierDismissible: false
                );
              }

              if(state is AssignmentFileOpenedState){
                OpenFile.open(state.tempPath);
              }
            },
          child: BlocBuilder<AssignmentDetailBloc, AssignmentDetailState>(
          builder: (context, state){
      // if(state is AssignmentDetailEmptyState){
      //     BlocProvider.of<AssignmentDetailBloc>(context)
      //         .add(FetchingSignedUrlEvent(assignment: assignment));
      // }
      if(state is AssignmentDetailLoadedState){

      }

      if(state is AssignmentDetailLoadingState){
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Padding(
        padding: EdgeInsets.all(20.0),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.only(top: 20.0),
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(S.of(context).subject, style: ThemeText.assignmentSubjectText),
                          Text(assignment.subject.name, style: ThemeText.menuDropDownText),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(S.of(context).teacher, style: ThemeText.assignmentSubjectText),
                          Text(assignment.teacher.getFullName, style: ThemeText.menuDropDownText),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(S.of(context).assignmentDate, style: ThemeText.assignmentSubjectText),
                          Text(Common.formatDate(assignment.dueDate), style: ThemeText.menuDropDownText),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(S.of(context).dueDate, style: ThemeText.assignmentSubjectText),
                          Text(Common.formatDate(assignment.dueDate), style: ThemeText.assignmentDueDateText),
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1.0,
                height: 0.8,
                color: Colors.black12,
              ),
              TabBar(
                indicator: CircleTabIndicator(color: Colors.black, radius: 3),
                tabs: [
                  Tab(
                    child: Text(
                        S.of(context).description,
                        style: ThemeText.assignmentTabTitleText),
                  ),
                  Tab(
                    child: Text(
                      S.of(context).attachments,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: TabBarView(
                    children: [
                      Text(assignment.description ?? "", style: ThemeText.loginInText,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: buildAttachmentsWidget(assignment.attachments),
                      ),
                    ],
                  ),
                ),
              ),
              isTeacher
                  ? LoginButton(
                buttonText: S.of(context).viewSubmission,
                onButtonPressed: viewAnswers,
              )
                  : LoginButton(
                buttonText: S.of(context).submitAnswer,
                onButtonPressed: viewSubmitAnswersPage,
              ),
            ],
          ),
        ),
      );
          }
          ),
        ),
      ),
    );
  }
}
