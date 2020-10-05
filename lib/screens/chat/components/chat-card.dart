import 'package:dsapp/screens/attendance/components/tab_indicator.dart';
import 'package:dsapp/screens/chat/components/online-indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
      leading: CircleAvatar(
        child: SvgPicture.asset(
          "assets/images/menu/Profile.svg",
          width: 30,
          height: 30,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Janet Fowler"),
          Text("6:30"),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("data",
            softWrap: true,
          ),
          OnlineIndicator(),
        ],
      ),
    );
  }
}
