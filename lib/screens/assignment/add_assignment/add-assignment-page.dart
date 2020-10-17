import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';

class AddAssignmentPage extends StatelessWidget {
  static const routeName = '/add-assignment';
  @override
  Widget build(BuildContext context) {
    final MenuArguments arguments = ModalRoute.of(context).settings.arguments;
//    final FeesRepository repository = FeesRepository(feesService: FeesService());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Add Assignment",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: AddAssignmentScreen(school: arguments.roleModules.school,),
    );
  }
}