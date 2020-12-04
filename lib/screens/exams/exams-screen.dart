import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/screens/exams/components/exams-card.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ExamsBloc, ExamsState>(
      listener: (context, state){
        if (state is ExamsErrorState) {
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
          child: BlocBuilder<ExamsBloc, ExamsState>(
            // ignore: missing_return
            builder: (context, state) {
              if (state is ExamsLoadedState) {
//                context.hideLoaderOverlay();
                if (state.examsPageData.results.length == 0) {
                  return Center(
                    child: Icon(
                      Icons.do_not_disturb,
                      size: 50.0,
                      color: Colors.black,
                      semanticLabel: "No Data Found",
                    ),
                  );
                } else{
                return ListView.builder(
                  itemCount: state.examsPageData.results.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ExamsCard(exams: state.examsPageData.results[index],
                    );
                  },
                );
                }
              }
              if (state is ExamsLoadingState){
//                context.showLoaderOverlay();
                return Center(child: Text(S.of(context).loading, style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,));
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
