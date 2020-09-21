import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/screens/menu/menu-bloc.dart';
import 'package:dsapp/screens/menu/menu-screen.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  MenuBloc menuBloc;

  @override
  void initState() {
    super.initState();

    menuBloc = MenuBloc();
  }

  @override
  void dispose() {
    menuBloc.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: MenuScreen(
        menus: menus,
        items: items,
      ),
    );
  }

  final menus = [
    MenuModel(
      title: "TimeTable",
      icon: "assets/icons/Calendar.svg"
    ),
    MenuModel(
        title: "TimeTable",
        icon: "assets/icons/Calendar.svg"
    ),
    MenuModel(
        title: "TimeTable",
        icon: "assets/icons/Calendar.svg"
    ),
    MenuModel(
        title: "TimeTable",
        icon: "assets/icons/Calendar.svg"
    ),
    MenuModel(
        title: "TimeTable",
        icon: "assets/icons/Calendar.svg"
    )
  ];

  final items = [
    DropdownMenuItem(child: Text("First item"), value: 1,),
    DropdownMenuItem(child: Text("First item"), value: 2,),
    DropdownMenuItem(child: Text("First item"), value: 3,),
  ];
}
