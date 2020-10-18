import 'package:dsapp/screens/chat/components/chat-card.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.79,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: InputWidget(),
              ),
            ],
          ),
        ),
    );
  }
}
