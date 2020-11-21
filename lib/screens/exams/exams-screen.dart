import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/screens/exams/components/exams-card.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ExamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ExamsBloc, ExamsState>(
      listener: (context, state){},
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: BlocBuilder<ExamsBloc, ExamsState>(
            // ignore: missing_return
            builder: (context, state) {
              if (state is ExamsLoadedState) {
//                context.hideLoaderOverlay();
                return ListView.builder(
                  itemCount: state.examsPageData.results.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ExamsCard(exams: state.examsPageData.results[index],
                    );
                  },
                );
              }
//              if(state is ExamsEmptyState){
//                print("Empty bloc");
//                BlocProvider.of<ExamsBloc>(context)
//                    .add(FetchingExamsEvent());
//              }

//              if(state is ExamsErrorState){
//                print("Empty bloc");
//                showDialog(
//                    context: context,
//                    builder: (_) => UserNotFoundDialog(),
//                    barrierDismissible: true
//                );
//              }

//              if (state is ExamsLoadingState){
//                context.showLoaderOverlay();
//                return Container();
////                return Center(
////                  child: CircularProgressIndicator(),
////                );
//              }

              if (state is ExamsLoadingState){
//                context.showLoaderOverlay();
                return Center(child: Text("Loading...", style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,));
//                  return CircularProgressIndicator();
              }

              return Container();
            },

          ),
        ),
      ),
    );
  }
}
