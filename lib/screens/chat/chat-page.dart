import 'package:dsapp/screens/chat/chat-screen.dart';
import 'package:dsapp/theme/style.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  static const routeName = '/chat';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Chat",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: ChatScreen(),
    );
  }
}
