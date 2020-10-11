import 'package:dsapp/models/menu-arguments.dart';
import 'package:dsapp/models/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({Key key, this.menu, this.roleModules})
      : super(key: key);
//  final String userId;
  final Module menu;
//  final String role;
  final RoleModules roleModules;

  @override
  Widget build(BuildContext context) {
    bool isParent = roleModules.role == "PARENT";

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/' + menu.menu.toLowerCase(),
              arguments: MenuArguments(module: menu, user: roleModules.user));
          print("menu from menu $menu");
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
                        isParent ? menu.description : menu.menu,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
            )),
      ),
    );
  }
}
