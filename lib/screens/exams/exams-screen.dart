import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/screens/exams/components/exams-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ExamsBloc, ExamsState>(
      listener: (context, state){},
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: BlocBuilder<ExamsBloc, ExamsState>(
            builder: (context, state) {
              if (state is ExamsLoadedState) {
                return ListView.builder(
                  itemCount: state.examsPageData.results.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ExamsCard(exams: state.examsPageData.results[index],
                    );
                  },
                );
              }
              if(state is ExamsEmptyState){
                print("Empty bloc");
                BlocProvider.of<ExamsBloc>(context)
                    .add(FetchingExamsEvent());
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
