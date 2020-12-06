import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamScoreScreen extends StatelessWidget {
  final ExamsModel exam;

  ExamScoreScreen({this.exam});

  @override
  Widget build(BuildContext context) {
    void initPage() {
      BlocProvider.of<ExamScoreBloc>(context)
          .add(FetchingExamScoreEvent(examinationId: exam.id.toString()));
    }

    void goBack() {
      initPage();
      Navigator.pop(context);
    }
    return BlocListener<ExamScoreBloc, ExamScoreState>(
      listener: (context, state){
        if (state is ExamScoreErrorState) {
          showDialog(
              context: context,
              builder: (_) => ErrorDialog(
                errorMessage: state.errorMessage,
                onButtonPressed: goBack,
              ),
              barrierDismissible: false);
        }
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).startDate + Common.formatDate(exam.startDate)),
                    Text(S.of(context).endDate + Common.formatDate(exam.endDate)),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(S.of(context).marked, style: TextStyle(color: Colors.green),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: BlocBuilder<ExamScoreBloc, ExamScoreState>(
                  builder: (context, state) {
                    if (state is ExamScoreLoadedState) {
                      return ListView.builder(
                        itemCount: state.examScorePageData.results.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return ExamScoreCard(score: state.examScorePageData.results[index],
                          );
                        },
                      );
                    }

                    if (state is ExamScoreLoadingState){
                      return Center(child: CircularProgressIndicator(),);
                    }

                    if(state is ExamScoreInitialState){
                      initPage();
                    }

                    if(state is ExamScoreEmptyState){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.do_not_disturb, size: 40,),
                          SizedBox(),
                          Text(S.of(context).noDataFound, style: TextStyle(fontSize: 20),),
                        ],
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
