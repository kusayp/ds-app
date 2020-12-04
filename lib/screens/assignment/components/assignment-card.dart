import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/common.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AssignmentCard extends StatelessWidget {
  final AssignmentModel assignment;
  final String role;
  final MenuArguments menuArguments;

  AssignmentCard({this.assignment, this.role, this.menuArguments});

  @override
  Widget build(BuildContext context) {

    List<int> colors = [
      0xff84A2D6,
      0xffA3A5B1,
      0xffF65A75,
      0xff39CB89,
      0xff6FCFC5,
      0xffFA8993,
      0xffFF7F00,
      0xffCED3D9,
    ];

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AssignmentDetailPage.routeName, arguments: AssignmentAnswerArguments(assignment: assignment, menuArguments: menuArguments));
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        elevation: 4,
        shape: Border(
          left: BorderSide(
            color: Color(randomChoice(colors)),
            width: 2,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(assignment.title, style: ThemeText.assignmentHeaderText,),
              Text(assignment.subject.name, style: ThemeText.assignmentSubjectText,),
              Divider(
                color: Color(0xffA3A5B1),
                thickness: 0.8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.of(context).due, style: TextStyle(fontSize: 12, color: Color(0xffF65A75)),),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Text(Common.formatDate(assignment.dueDate), style: ThemeText.assignmentDateText,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xffFF7F00),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
