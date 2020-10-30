import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/chat/components/online-indicator.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../screens.dart';

class ChatList extends StatelessWidget {
  final UserModel user;

  const ChatList({Key key, this.user}) : super(key: key);

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
          Text(user.firstName + " " + user.lastName),
          Icon(Icons.arrow_forward_ios, size: 20.0, color: Colors.black,),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          user.role == 8 ? Text(
            "Teacher",
            softWrap: true,
          ) : Text(
            "",
            softWrap: true,
          ),
//          OnlineIndicator(),
        ],
      ),
      onTap: () => Navigator.pushNamed(context, ConversationPage.routeName, arguments: user),
    );
  }
}

class InputWidget extends StatelessWidget {
  final UserModel user;

  final TextEditingController textEditingController = new TextEditingController();

  InputWidget({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              child: new IconButton(
                icon: new Icon(Icons.face),
                color: appTheme().primaryColor,
                onPressed: (){},
              ),
            ),
            color: Colors.white,
          ),

          // Text input
          Flexible(
            child: Container(
              child: TextField(
                style: TextStyle(color: appTheme().primaryColor, fontSize: 15.0),
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type a message',
                  hintStyle: TextStyle(color: appTheme().primaryColor),
                ),
              ),
            ),
          ),

          // Send Message Button
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => sendMessage(context),
                color: appTheme().primaryColor,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(
          border: new Border(
              top: new BorderSide(color: appTheme().primaryColor, width: 0.5)),
          color: Colors.white),
    );
  }

  void sendMessage(context) {
    BlocProvider.of<ChatBloc>(context)
        .add(SendTextMessageEvent(message: textEditingController.text, to: user));
    textEditingController.clear();
  }
}

class MessageCard extends StatelessWidget {
  final ChatModel message;
  final int userId;

  const MessageCard({Key key, this.message, this.userId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isSelf = message.direction == Direction.OUT.index;
    return Container(
        child: Column(children: <Widget>[
          buildMessageContainer(isSelf, message, context),
          buildTimeStamp(isSelf, message)
        ]));
  }

  Row buildMessageContainer(bool isSelf, ChatModel message, BuildContext context) {
    double lrEdgeInsets = 15.0;
    double tbEdgeInsets = 10.0;
//    if (message is TextMessage) {
//      lrEdgeInsets = 15.0;
//      tbEdgeInsets = 10.0;
//    }
    return Row(
      children: <Widget>[
        Container(
          child: buildMessageContent(isSelf, message,context),
          padding: EdgeInsets.fromLTRB(
              lrEdgeInsets, tbEdgeInsets, lrEdgeInsets, tbEdgeInsets),
          constraints: BoxConstraints(maxWidth: 200.0),
          decoration: BoxDecoration(
              color: isSelf
                  ? Colors.blue
                  : Colors.blueGrey,
              borderRadius: BorderRadius.circular(8.0)),
          margin: EdgeInsets.only(
              right: isSelf ? 10.0 : 0, left: isSelf ? 0 : 10.0),
        )
      ],
      mainAxisAlignment: isSelf
          ? MainAxisAlignment.end
          : MainAxisAlignment.start, // aligns the chatitem to right end
    );
  }

  buildMessageContent(bool isSelf, ChatModel message, BuildContext context) {
    return Text(
      message.message,
      style: TextStyle(
          color:
          isSelf ? Colors.white : Colors.black),
    );
  }

  Row buildTimeStamp(bool isSelf, ChatModel message) {
    return Row(
        mainAxisAlignment:
        isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              DateFormat('dd MMM kk:mm').format(
                  DateTime.fromMillisecondsSinceEpoch(message.timeStamp)),
//              style: Styles.date,
            ),
            margin: EdgeInsets.only(
                left: isSelf ? 5.0 : 0.0,
                right: isSelf ? 0.0 : 5.0,
                top: 5.0,
                bottom: 5.0),
          )
        ]);
  }

//  return Padding(
//  padding: const EdgeInsets.symmetric(
//  vertical: 8.0,
//  horizontal: 5.0,
//  ),
//  child: Align(
//  alignment: message.senderId == userId
//  ? Alignment.centerRight
//      : Alignment.centerLeft,
//  child: Column(
//  crossAxisAlignment: message.senderId == userId
//  ? CrossAxisAlignment.end
//      : CrossAxisAlignment.start,
//  children: [
//
//  ],
//  ),
//  ),
//  );
}


