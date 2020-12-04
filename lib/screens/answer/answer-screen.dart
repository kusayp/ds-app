import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens.dart';

class AnswerScreen extends StatelessWidget {
  final int assignment;

  AnswerScreen({this.assignment});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnswerBloc, AnswerState>(
        listener: (context, state){
          if (state is AnswerErrorState){
            print(state.errorMessage);
//          context.hideLoaderOverlay();
            showDialog(
                context: context,
                builder: (_) => ErrorDialog(errorMessage: state.errorMessage,),
                barrierDismissible: false
            );
          }

        },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: BlocBuilder<AnswerBloc, AnswerState>(
            builder: (context, state) {
              if (state is AnswerLoadedState) {
                if(state.answerPageData.result.length == 0){
                  return Center(
                    child: Icon(
                      Icons.do_not_disturb,
                      size: 50.0,
                      color: Colors.black,
                      semanticLabel: "No Answer Submitted",
                    ),
                  );
                }else{
                  return ListView.builder(
                    itemCount: state.answerPageData.totalElement,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return AnswerCard(
                        answer: state.answerPageData.result[index],
                        role: state.role,
                      );
                    },
                  );
                }
              }

              if (state is AnswerEmptyState) {
                BlocProvider.of<AnswerBloc>(context)
                    .add(FetchingAnswerEvent(assignmentId: assignment));
              }

              if (state is AnswerLoadingState){
//                context.showLoaderOverlay();
                return Center(child: Text(S.of(context).loading, style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,));
//                  return CircularProgressIndicator();
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
