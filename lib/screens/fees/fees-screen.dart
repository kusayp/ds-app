import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/fees/components/fees-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeesScreen extends StatelessWidget {
  final RoleModules roleModules;

  const FeesScreen({Key key, this.roleModules}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: BlocBuilder<FeesBloc, FeesState>(
          builder: (context, state) {
            if (state is FeesLoadedState) {
              return ListView.builder(
                itemCount: state.feesPageData.results.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return FeesCard(fees: state.feesPageData.results[index], classId: roleModules.school.studentClass.id.toString(), userId: roleModules.user.id.toString()
                  );
                },
              );
            }
            if(state is FeesEmptyState){
              print("Empty bloc");
              BlocProvider.of<FeesBloc>(context)
                  .add(FetchingFeesEvent(classId: roleModules.school.studentClass.id.toString(), userId: roleModules.user.id.toString()));
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
