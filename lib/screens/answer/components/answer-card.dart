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

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AssignmentDetailPage.routeName,);
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        elevation: 4,
        shape: Border(
            left: BorderSide(
              color: Colors.amber,
              width: 2,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("answer.title", style: TextStyle(fontSize: 16, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
              Text("assignment.subject.name", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black26),),
              Divider(
                color: Colors.black,
                thickness: 0.8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.of(context).due, style: TextStyle(fontSize: 12, color: Colors.red),),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Text("Common.formatDate(assignment.dueDate)", style: TextStyle(fontSize: 12.0),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color:  Colors.redAccent,
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
