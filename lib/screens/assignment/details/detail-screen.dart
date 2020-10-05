import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/attendance/components/tab_indicator.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/common.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';


class AssignmentDetailScreen extends StatelessWidget {
  final AssignmentModel assignment;
  final String role;

  AssignmentDetailScreen({this.assignment, this.role});

  @override
  Widget build(BuildContext context) {
    void viewAnswers() {
      Navigator.pushNamed(
        context,
        AnswerPage.routeName,
        arguments: assignment,
      );
    }

    void viewSubmitAnswersPage() {
      Navigator.pushNamed(
        context,
        SubmitAnswerPage.routeName,
        arguments: assignment.attachment,
      );
    }

    final isTeacher = role == "ENSEINGNANT";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subject:", style: textSmallStyle),
                          Text(assignment.subject.name, style: textSmallBlackStyle),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Teacher:", style: textSmallStyle),
                          Text(assignment.teacher.firstName +
                              ' ' +
                              assignment.teacher.lastName, style: textSmallBlackStyle),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Assignment date:", style: textSmallStyle),
                          Text(Common.formatDate(assignment.dueDate), style: textSmallBlackStyle),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Due date:", style: textSmallStyle),
                          Text(Common.formatDate(assignment.dueDate), style: textSmallBlackStyle),
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
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
                        "Description",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Attachments",
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
                        Text(assignment.description, style: textSmallBlackStyle,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 30.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(assignment.attachment??"No attachment"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                isTeacher
                    ? LoginButton(
                  buttonText: "View Submisssion",
                  onButtonPressed: viewAnswers,
                )
                    : LoginButton(
                  buttonText: "Submit Answer",
                  onButtonPressed: viewSubmitAnswersPage,
                ),
              ],
            ),
          ),
        ),
      ),
//      bottomSheet: isTeacher
//          ? LoginButton(
//              buttonText: "View Submisssion",
//              onButtonPressed: viewAnswers,
//            )
//          : LoginButton(
//              buttonText: "Submit Answer",
//              onButtonPressed: viewSubmitAnswersPage,
//            ),
    );
  }
}
