import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/menu/menu-screen.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuPage extends StatelessWidget {
  static const routeName = '/menu';
  final List<Module> modules;

  MenuPage({this.modules});

  @override
  Widget build(BuildContext context) {
    final MenuService service = MenuService();
    final LoginResponse arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: appTheme().backgroundColor,
      body: BlocProvider(
        create: (context) => MenuBloc(menuService: service),
        child: MenuScreen(
          user: arguments.user,
          schools: arguments.schools,
        ),
      ),
    );
  }
}
