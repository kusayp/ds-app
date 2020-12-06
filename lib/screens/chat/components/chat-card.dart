import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
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
          Icon(
            Icons.arrow_forward_ios,
            size: 20.0,
            color: Colors.black,
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          user.role == 8
              ? Text(
                  "Teacher",
                  softWrap: true,
                )
              : Text(
                  "",
                  softWrap: true,
                ),
//          OnlineIndicator(),
        ],
      ),
      onTap: () => Navigator.pushNamed(context, ConversationPage.routeName,
          arguments: user),
    );
  }
}

class InputWidget extends StatelessWidget {
  final UserModel user;
  final bool loading;

  final TextEditingController textEditingController =
      new TextEditingController();

  InputWidget({Key key, this.user, this.loading}) : super(key: key);

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
                onPressed: () {},
              ),
            ),
            color: Colors.white,
          ),

          // Text input
          Flexible(
            child: Container(
              child: TextField(
                style:
                    TextStyle(color: appTheme().primaryColor, fontSize: 15.0),
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: S.of(context).typeAMessage,
                  hintStyle: TextStyle(color: appTheme().primaryColor),
                ),
                maxLines: 1,
                // textInputAction: TextInputAction.newline,
              ),
            ),
          ),

          // Send Message Button
          loading
              ? CircularProgressIndicator()
              : Material(
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
    BlocProvider.of<ChatBloc>(context).add(
        SendTextMessageEvent(message: textEditingController.text, to: user));
    textEditingController.clear();
  }
}

class SendingCard extends StatelessWidget{
  final String text;

  const SendingCard({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(text, style: TextStyle(color: Colors.white),),
          padding: EdgeInsets.fromLTRB(
              15.0, 10.0, 15.0, 10.0),
          constraints: BoxConstraints(maxWidth: 200.0),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8.0)),
          margin: EdgeInsets.only(
              right: 10.0, left:0),
        ),
      ],
      mainAxisAlignment:
          MainAxisAlignment.end
    );
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

  Row buildMessageContainer(
      bool isSelf, ChatModel message, BuildContext context) {
    double lrEdgeInsets = 15.0;
    double tbEdgeInsets = 10.0;

    return Row(
      children: <Widget>[
        Container(
          child: buildMessageContent(isSelf, message, context),
          padding: EdgeInsets.fromLTRB(
              lrEdgeInsets, tbEdgeInsets, lrEdgeInsets, tbEdgeInsets),
          constraints: BoxConstraints(maxWidth: 200.0),
          decoration: BoxDecoration(
              color: isSelf ? Colors.blue : Colors.blueGrey,
              borderRadius: BorderRadius.circular(8.0)),
          margin: EdgeInsets.only(
              right: isSelf ? 10.0 : 0, left: isSelf ? 0 : 10.0),
        ),
        isSelf ? Align(
          alignment: Alignment.bottomRight,
          child: Icon(Icons.check),
        ) : SizedBox(),
      ],
      mainAxisAlignment: isSelf
          ? MainAxisAlignment.end
          : MainAxisAlignment.start, // aligns the chatitem to right end
    );
  }

  buildMessageContent(bool isSelf, ChatModel message, BuildContext context) {
    return Text(
      message.message,
      style: TextStyle(color: isSelf ? Colors.white : Colors.black),
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
}

class ChatItem extends StatelessWidget {
  final UserModel user;

  ChatItem({this.user});

  @override
  Widget build(BuildContext context) {
    return
    Card(
      child: ListTile(
        onTap: () => Navigator.pushNamed(context, ConversationPage.routeName, arguments: user),
        leading: user.picture != null ? CircleAvatar(backgroundImage: NetworkImage(this.user.picture),radius: 30.0,) : CircleAvatar(child: SvgPicture.asset("assets/images/menu/Profile.svg",width: 30,height: 30,),),
        title: Text(user.getFullName, style: TextStyle(fontSize: 15),),
        trailing: Icon(Icons.arrow_forward_ios, size: 20.0, color: Colors.black,),
      ),
    );
  }
}

class ChatCard extends StatelessWidget{
  final QueryDocumentSnapshot message;
  final int userId;

  const ChatCard({Key key, this.message, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMe = userId == message.data()['from'];
    CrossAxisAlignment messageAlignment() {
      if (isMe) {
        return CrossAxisAlignment.end;
      } else {
        return CrossAxisAlignment.start;
      }
    }
    MainAxisAlignment timeAlignment() {
      if (isMe) {
        return MainAxisAlignment.end;
      } else {
        return MainAxisAlignment.start;
      }
    }
    return Column(
      crossAxisAlignment: messageAlignment(),
      children: [
        Container(
          constraints: BoxConstraints(minWidth: 70.0, maxWidth: 250.0),
//      width: MediaQuery.of(context).size.width * 0.75,
          margin: isMe
              ? EdgeInsets.only(top: 7.0, bottom: 8.0, left: 80.0)
              : EdgeInsets.only(top:8.0, bottom: 8.0, right: 80.0),
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          decoration: isMe ? BoxDecoration(
              color: appTheme().splashColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0)
              )
          ) : BoxDecoration(
              color: Color(0xFFe4f1fe),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0)
              )
          ),
          child: Text(
              message.data()['message'],
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600
              )
          ),
        ),

        // SizedBox(height: 8.0,),
        Row(
          mainAxisAlignment: timeAlignment(),
          children: [
            Text(
              DateFormat('h:mm a').format(
                  DateTime.fromMillisecondsSinceEpoch(message.data()['timestamp'].millisecondsSinceEpoch)),
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600
              ),
            ),
            isMe ? Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.check, size: 10.0,),
            ) : SizedBox(),
          ],
        ),
      ],
    );
  }
}
