import 'package:dsapp/models/menu-arguments.dart';
import 'package:dsapp/models/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({Key key, this.menu, this.roleModules})
      : super(key: key);
  final Module menu;
  final RoleModules roleModules;

  @override
  Widget build(BuildContext context) {
    bool isParent = roleModules.role == "PARENT";

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/' + menu.menu.toLowerCase(),
              arguments: MenuArguments(module: menu, roleModules: roleModules));
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

class NotificationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height/1.2,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("NOTIFICATIONS"),
                  IconButton(icon: Icon(Icons.close, color: Colors.black), onPressed: () => Navigator.of(context).pop(),)
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index){
                    return NotificationCard();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      elevation: 4,
      shape: Border(
          left: BorderSide(
            color: Colors.amber,
            width: 2,
          )
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Communicate"),
                Text("1 hour ago"),
              ],
            ),
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled", softWrap: true, style: TextStyle(fontSize: 12, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
          ],
        ),
      ),
    );
  }
}
