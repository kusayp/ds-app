import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dsapp/screens/screens.dart';

class NotificationPage extends StatelessWidget {
  static const routeName = '/notification';
  final List<Module> modules;

  NotificationPage({this.modules});

  @override
  Widget build(BuildContext context) {
    final MenuService service = MenuService();
    final String arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(S.of(context).notifications, style: ThemeText.onBoardingHeader,),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: BlocProvider(
        create: (context) => MenuBloc(menuService: service),
        child: NotificationScreen(
          school: arguments,
        ),
      ),
    );
  }
}
