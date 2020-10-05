import 'package:dsapp/screens/chat/components/chat-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/icons/Edit.svg",
                  width: 20,
                  height: 20,
                ),
                Icon(Icons.search)
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ChatList();
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
