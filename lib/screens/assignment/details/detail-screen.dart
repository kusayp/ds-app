import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/attendance/components/tab_indicator.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/common.dart';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).subject("subject")),
                    Text(assignment.subject.name),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Teacher:"),
                    Text(assignment.teacher.firstName +
                        ' ' +
                        assignment.teacher.lastName),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Assignment date:"),
                    Text(Common.formatDate(assignment.dueDate)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Due date:"),
                    Text(Common.formatDate(assignment.dueDate)),
                  ],
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
                        "Today",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "This Week",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 100,
                  child: TabBarView(
                    children: [
                      Text(assignment.description),
                      Text(assignment.description),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: isTeacher
          ? LoginButton(
              buttonText: "View Submisssion",
              onButtonPressed: viewAnswers,
            )
          : LoginButton(
              buttonText: "Submit Answer",
              onButtonPressed: viewSubmitAnswersPage,
            ),
    );
  }
}
