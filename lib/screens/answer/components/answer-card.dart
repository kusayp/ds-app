import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/common.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class AnswerCard extends StatelessWidget {
  final AnswerModel answer;
  final String role;

  AnswerCard({this.answer, this.role});

  @override
  Widget build(BuildContext context) {
    final isTeacher = role == "ENSEINGNANT";

    List<String> colors = [
      '#84A2D6',
      '#A3A5B1',
      '#F65A75',
      '#39CB89',
      '#6FCFC5',
      '#FA8993',
      '#FF7F00',
      '#CED3D9',
    ];

    void pushToAssignmentScorePage() {
      Navigator.pushNamed(context, AnswerScorePage.routeName,
          arguments: answer);
    }

    return GestureDetector(
      onTap: isTeacher ? pushToAssignmentScorePage : () {},
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        elevation: 4,
        shape: Border(
            left: BorderSide(
          color: Hexcolor(randomChoice(colors)),
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
                        style: ThemeText.assignmentHeaderText,
                      ),
                    )
                  : SizedBox(),
//              isTeacher
//                  ? Text(
//                      answer.assignment.title,
//                      style: ThemeText.assignmentTabTitleText,
//                    )
//                  : Text(
//                      answer.assignment.title,
//                      style: ThemeText.assignmentTabTitleText,
//                    ),
//              SizedBox(
//                height: 20.0,
//              ),
              answer.assignment.subject != null
                  ? Text(
                      answer.assignment.subject?.name,
                      style: ThemeText.assignmentSubjectText,
                    )
                  : Text(''),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).due,
                    style: ThemeText.assignmentSubjectText,
                  ),
                  Text(
                    Common.formatDate(answer.assignment.dueDate),
                    style: ThemeText.assignmentSubjectText,
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
                    style: ThemeText.assignmentSubjectText,
                  ),
                  Text(
                    Common.formatDate(answer.assignment.dueDate),
                    style: ThemeText.assignmentSubjectText,
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

class AnswerAttachButton extends StatelessWidget {
  final VoidCallback onButtonPressed;
  final String buttonText;

  const AnswerAttachButton({Key key, this.onButtonPressed, this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 40.0),
      child: SizedBox(
        width: 150.0,
        height: 50.0,
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: appTheme().primaryColor,
          onPressed: onButtonPressed,
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/Upload.svg',
                width: 20.0,
                height: 20.0,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(buttonText,
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
