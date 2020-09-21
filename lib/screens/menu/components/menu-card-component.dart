import 'package:dsapp/models/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({Key key, this.menu}) : super(key: key);

  final MenuModel menu;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;

    return Card(
        color: Colors.white,
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  menu.icon,
                  width: 50.0,
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: Text(
                    menu.title,
                    style: TextStyle(color: Colors.black87, fontSize: 14.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
        ));
  }
}