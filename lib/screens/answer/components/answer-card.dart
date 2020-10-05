import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnswerCard extends StatelessWidget {
  final AnswerModel answer;
  final String role;

  AnswerCard({this.answer, this.role});

  @override
  Widget build(BuildContext context) {
    final isTeacher = role == "ENSEINGNANT";

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AssignmentDetailPage.routeName,
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        elevation: 4,
        shape: Border(
            left: BorderSide(
          color: Colors.amber,
          width: 2,
        )),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              isTeacher
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        answer.student.firstName +
                            " " +
                            answer.student.lastName,
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : SizedBox(),
              isTeacher
                  ? Text(
                      answer.assignment.title,
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      answer.assignment.title,
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                answer.description,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black26),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).due,
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                  Text(
                    Common.formatDate(answer.assignment.dueDate),
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).due,
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                  Text(
                    Common.formatDate(answer.assignment.dueDate),
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
