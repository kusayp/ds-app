import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ExamScoreCard extends StatelessWidget {
  final ExamScoreModel score;

  ExamScoreCard({this.score});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    score.subject.name,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 40,
                    child: Align(
                      child: Text(
                        score.mark.toString(),
                        style: TextStyle(fontSize: 12.0),
                      ),
                      alignment: Alignment.center,
                    ),
                    color: Colors.green,
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Common.formatDate(score.date),
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    S.of(context).obtainedMark + score.mark.toString(),
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Text(
                    score.mark.toString(),
                    style: TextStyle(fontSize: 12.0),
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
