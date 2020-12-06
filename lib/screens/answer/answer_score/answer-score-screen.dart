import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/answer/answer-page.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/common.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnswerScoreScreen extends StatelessWidget {
  final AnswerModel answer;

  AnswerScoreScreen({this.answer});

  @override
  Widget build(BuildContext context) {
    void pushToAssignmentScorePage() {}

    void _showSnackBar(String success, Color color) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(success),
        backgroundColor: color,
      ));
    }

    void goBack() {
      Navigator.pop(context);
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
                S.of(context).assignmentScoreSuccessfullySaved, Colors.green);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child:
              BlocBuilder<AnswerBloc, AnswerState>(builder: (context, state) {
              // if (state is AnswerEmptyState) {
              //   return ;
              // }

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
                  arguments: answer.assignment.id,
                ),
              );
            }

              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    height: MediaQuery.of(context).size.height / 5,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(S.of(context).subject,
                                style: ThemeText.assignmentSubjectText),
                            Text(answer.assignment.subject.name,
                                style: ThemeText.menuDropDownText),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(S.of(context).subject,
                                style: ThemeText.assignmentSubjectText),
                            Text(
                                answer.assignment.teacher.firstName +
                                    ' ' +
                                    answer.assignment.teacher.lastName,
                                style: ThemeText.menuDropDownText),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(S.of(context).subject,
                                style: ThemeText.assignmentSubjectText),
                            Text(Common.formatDate(answer.assignment.dueDate),
                                style: ThemeText.menuDropDownText),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(S.of(context).subject,
                                style: ThemeText.assignmentSubjectText),
                            Text(Common.formatDate(answer.assignment.dueDate),
                                style: ThemeText.assignmentDueDateText),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(S.of(context).subject,
                                style: ThemeText.assignmentSubjectText),
                            Text(Common.formatDate(answer.assignment.dueDate),
                                style: ThemeText.menuDropDownText),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, bottom: 100.0),
                    child: Container(
                      height: 30.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              answer.attachment ?? S.of(context).noAttachment),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    height: 0.8,
                    color: Color(0xffA3A5B1),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).obtain,
                            style: ThemeText.loginInText,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 30.0,
                            width: 70.0,
                            decoration:
                            BoxDecoration(border: Border.all(width: 1.5)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("/"),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 30.0,
                            width: 70.0,
                            decoration:
                            BoxDecoration(border: Border.all(width: 1.5)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).result,
                          style: ThemeText.loginInText,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Switch(value: true, onChanged: (value) {}),
                      ],
                    ),
                  ),
                  LoginButton(
                    buttonText: S.of(context).mark,
                    onButtonPressed: pushToAssignmentScorePage,
                  )
                ],
              );
          }),
        ),
      ),
    );
  }
}
