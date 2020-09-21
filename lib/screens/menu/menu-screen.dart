import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/screens/menu/components/menu-card-component.dart';
import 'package:dsapp/theme/style.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final List<MenuModel> menus;
  final List<DropdownMenuItem> items;

  MenuScreen({this.menus, this.items});
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme().backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Jane Doe"),
                      Icon(Icons.notifications_active)
                    ],
                  ),
                ),
                Container(
                  child: DropdownButton(items: widget.items, onChanged: null),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.menus.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1,),
                  itemBuilder: (context, index) {
                    return MenuCard(menu: widget.menus[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
