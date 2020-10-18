import 'package:dsapp/blocs/assignment/assignment.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/assignment/components/assignment-card.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignmentScreen extends StatelessWidget {
  final MenuArguments user;

  const AssignmentScreen({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return BlocListener<AssignmentBloc, AssignmentState>(
      listener: (context, state){},
      child: SafeArea(
          child:
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Divider(
                      color: Colors.black,
                      thickness: 1.0,
                      indent: MediaQuery.of(context).size.width*0.17,
                    ),
                    Text("Current Week", style: ThemeText.assignmentPeriodText,),
                  ],
                ),

                BlocBuilder<AssignmentBloc, AssignmentState>(
                  builder: (context, state){
                    if(state is AssignmentLoadedState){
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.assignmentPageData.result.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return AssignmentCard(
                              assignment: state.assignmentPageData.result[index],
                              role: state.role,
                              menuArguments: user,
                            );
                          }
                        )
//                          children: buildAssignmentCards(state.assignmentPageData),
                      );
                    }
                    if(state is AssignmentEmptyState){
                      print("Empty bloc");
                      BlocProvider.of<AssignmentBloc>(context)
                          .add(FetchingAssignmentEvent(teacherId: user.roleModules.user.id.toString()));
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}
