import 'package:dsapp/blocs/assignment/assignment.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/assignment/components/assignment-card.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignmentScreen extends StatelessWidget {
  final MenuArguments user;

  const AssignmentScreen({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    void goBackToLogin(){
      BlocProvider.of<AssignmentBloc>(context)
          .add(FetchingAssignmentEvent(teacherId: user.roleModules.user.id.toString()));
    }

    return BlocListener<AssignmentBloc, AssignmentState>(
      listener: (context, state){
        if (state is AssignmentErrorState){
          print(state.errorMessage);
//          context.hideLoaderOverlay();
          showDialog(
              context: context,
              builder: (_) => ErrorDialog(errorMessage: state.errorMessage,),
              barrierDismissible: false
          );
        }

        if (state is NoConnectionState){
          showDialog(
              context: context,
              builder: (_) => NoConnectionDialog(onButtonPressed: goBackToLogin,),
              barrierDismissible: false
          );
        }
      },
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
                    Text(S.of(context).currentWeek, style: ThemeText.assignmentPeriodText,),
                  ],
                ),

                BlocBuilder<AssignmentBloc, AssignmentState>(
                  builder: (context, state){
                    if(state is AssignmentLoadedState){
                      if(state.assignmentPageData.result.isEmpty){
                        return Center(
                          child: Icon(
                            Icons.do_not_disturb,
                            size: 50.0,
                            color: Colors.black,
                            semanticLabel: "No Assignments Submitted",
                          ),
                        );
                      }else{
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
                    }
                    if(state is AssignmentEmptyState){
                      goBackToLogin();
                    }

                    if (state is AssignmentLoadingState){
//                context.showLoaderOverlay();
                      return Center(child: CircularProgressIndicator());
//                  return CircularProgressIndicator();
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
