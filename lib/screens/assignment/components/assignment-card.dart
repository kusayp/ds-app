import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/common.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';

class AssignmentCard extends StatelessWidget {
  final AssignmentModel assignment;
  final String role;
  final MenuArguments menuArguments;

  AssignmentCard({this.assignment, this.role, this.menuArguments});

  @override
  Widget build(BuildContext context) {

    List<String> colors = ['#84A2D6', '#A3A5B1', '#F65A75', '#39CB89', '#6FCFC5', '#FA8993', '#FF7F00', '#CED3D9',];

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AssignmentDetailPage.routeName, arguments: AssignmentAnswerArguments(assignment: assignment, menuArguments: menuArguments));
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        elevation: 4,
        shape: Border(
          left: BorderSide(
            color: Hexcolor(randomChoice(colors)),
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
                color: Hexcolor('#A3A5B1'),
                thickness: 0.8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.of(context).due, style: TextStyle(fontSize: 12, color: Hexcolor('#F65A75')),),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Text(Common.formatDate(assignment.dueDate), style: ThemeText.assignmentDateText,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Hexcolor('#FF7F00'),
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
