import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/screens/assignment/assignment-screen.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignmentPage extends StatelessWidget {
  static const routeName = '/assignment';
  @override
  Widget build(BuildContext context) {
    void handleClick(String value) {
      switch (value){
        case 'Add Assignment':
          Navigator.pushNamed(
            context,
            SubmitAnswerPage.routeName,
//            arguments: assignment.attachment,
          );
      }
    }
    final AssignmentRepository repository = AssignmentRepository(assignmentService: AssignmentService());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Assignment",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, size: 20.0, color: Colors.black,),
            onSelected: handleClick,
              itemBuilder: (BuildContext contect) {
            return {"Overview", "Add Assignment"}.map((String choice) {
              return PopupMenuItem<String>(
                child: Text(choice),
                value: choice,
              );
            }
            ).toList();
          }
          )
//          Icon(Icons.more_vert, size: 20.0, )
        ],
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: BlocProvider(
        create: (context) => AssignmentBloc(repository: repository),
        child: AssignmentScreen(),
      ),
    );
  }
}
