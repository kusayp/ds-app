import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/fees/components/fees-card.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeesScreen extends StatelessWidget {
  final RoleModules roleModules;
  final String classId;

  const FeesScreen({Key key, this.roleModules, this.classId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<FeesBloc, FeesState>(
      listener: (context, state){
        if (state is FeesErrorState) {
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
          child: BlocBuilder<FeesBloc, FeesState>(
            builder: (context, state) {
              if (state is FeesLoadedState) {
                return ListView.builder(
                  itemCount: state.feesPageData.results.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return FeesCard(fees: state.feesPageData.results[index], classId: classId, userId: roleModules.user.id.toString()
                    );
                  },
                );
              }

              if(state is FeesEmptyState){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.do_not_disturb, size: 40, color: Colors.black,),
                    SizedBox(),
                    Text(S.of(context).noDataFound, style: TextStyle(fontSize: 20),),
                  ],
                );
              }

              if(state is FeesInitialState){
                BlocProvider.of<FeesBloc>(context)
                    .add(FetchingFeesEvent(classId: classId, userId: roleModules.user.id.toString()));
              }

              if (state is FeesLoadingState){
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
