import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens.dart';

class AnswerScreen extends StatelessWidget {
  final AssignmentModel assignment;

  AnswerScreen({this.assignment});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: BlocBuilder<AnswerBloc, AnswerState>(
          builder: (context, state) {
            if (state is AnswerLoadedState) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: state.answerPageData.result.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return AnswerCard(
                          answer: state.answerPageData.result[index],
                        );
                      }));
            }
            if (state is AnswerEmptyState) {
              print("Empty bloc");
              BlocProvider.of<AnswerBloc>(context)
                  .add(FetchingAnswerEvent(assignmentId: assignment.id));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
