import 'package:dsapp/models/menu/menu-model.dart';
import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({Key key, this.menu}) : super(key: key);

  final Module menu;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: (){
            Navigator.pushNamed(context, '/'+menu.menu.toLowerCase(),);
        },
        child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      menu.icon,
                      width: 80.0,
                      height: 80.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        menu.menu,
                        style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
            )),
      ),
    );
  }
}