import 'package:dsapp/models/models.dart';
import 'package:dsapp/theme/style.dart';
import 'package:flutter/material.dart';

import '../../screens.dart';

class AssignmentDetailPage extends StatelessWidget {
  static const routeName = '/assignment-detail';

  @override
  Widget build(BuildContext context) {
    final AssignmentArguments arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          arguments.assignment.title,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: AssignmentDetailScreen(assignment: arguments.assignment, role: arguments.role ,),
    );
  }
}
