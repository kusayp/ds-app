import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens.dart';

class ParentStudentMenuPage extends StatelessWidget {
  static const routeName = '/parent_student';
  final List<Module> modules;

  ParentStudentMenuPage({this.modules});

  @override
  Widget build(BuildContext context) {
    final MenuService service = MenuService();
    final MenuArguments arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: BlocProvider(
        create: (context) => MenuBloc(menuService: service),
        child: ParentStudentMenuScreen(
          module: arguments.module,
        ),
      ),
    );
  }
}
