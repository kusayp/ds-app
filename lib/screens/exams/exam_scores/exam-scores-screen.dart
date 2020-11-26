import 'package:dsapp/blocs/blocs.dart';
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
    return BlocListener<ExamScoreBloc, ExamScoreState>(
      listener: (context, state){
        if (state is ExamScoreErrorState) {
          print(state.errorMessage);
//          context.hideLoaderOverlay();
          showDialog(
              context: context,
              builder: (_) => ErrorDialog(
                errorMessage: state.errorMessage,
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
                    Text("Start Date: " + Common.formatDate(exam.startDate)),
                    Text("End Date: " + Common.formatDate(exam.endDate)),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text("MARKED", style: TextStyle(color: Colors.green),),
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
//                context.showLoaderOverlay();
                      return Center(child: Text("Loading...", style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,));
//                  return CircularProgressIndicator();
                    }

                    if(state is ExamScoreInitialState){
                      print("Empty bloc");
                      BlocProvider.of<ExamScoreBloc>(context)
                          .add(FetchingExamScoreEvent(examinationId: exam.id.toString()));
                    }

                    if(state is ExamScoreEmptyState){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.do_not_disturb, size: 40,),
                          SizedBox(),
                          Text("No Data Found", style: TextStyle(fontSize: 20),),
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
