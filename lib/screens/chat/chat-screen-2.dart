//import 'package:dsapp/blocs/blocs.dart';
//import 'package:dsapp/generated/l10n.dart';
//import 'package:dsapp/models/models.dart';
//import 'package:dsapp/utils/style.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:intl/intl.dart';
//
//import 'components/chat-card.dart';
//
//class ConversationScreen extends StatefulWidget {
//  final UserModel user;
//
//  ConversationScreen({this.user});
//
//  @override
//  _ChatScreenState createState() => _ChatScreenState();
//}
//
//class _ChatScreenState extends State<ConversationScreen> {
//  List<ChatModel> messages = List();
//  final TextEditingController textEditingController =
//  new TextEditingController();
//
//  _buildMessage(ChatModel message, bool isMe){
//    final Container msg = Container(
//      width: MediaQuery.of(context).size.width * 0.75,
//      margin: isMe
//          ? EdgeInsets.only(top: 7.0, bottom: 8.0, left: 80.0)
//          : EdgeInsets.only(top:8.0, bottom: 8.0),
//      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
//      decoration: isMe ? BoxDecoration(
//          color: appTheme().splashColor,
//          borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(15.0),
//              bottomLeft: Radius.circular(15.0),
//              topRight: Radius.circular(15.0)
//          )
//      ) : BoxDecoration(
//          color: Color(0xFFe4f1fe),
//          borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(15.0),
//              topRight: Radius.circular(15.0),
//              bottomRight: Radius.circular(15.0)
//          )
//      ),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Text(
//            DateFormat('dd MMM kk:mm').format(
//                DateTime.fromMillisecondsSinceEpoch(message.timeStamp)),
//            style: TextStyle(
//                color: Colors.blueGrey,
//                fontSize: 13.0,
//                fontWeight: FontWeight.w600
//            ),
//          ),
//          SizedBox(height: 8.0,)
//          ,       Text(
//              message.message,
//              style: TextStyle(
//                  color: Colors.blueGrey,
//                  fontSize: 13.0,
//                  fontWeight: FontWeight.w600
//              )
//          ),
//        ],
//      ),
//    );
//    if (isMe){
//      return msg;
//    }
//    return Row(
//      children: <Widget>[
//        msg,
////        IconButton(
////          icon: message.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
////          iconSize: 30.0,
////          color: message.isLiked ? Colors.red : Colors.blueGrey,
////          onPressed: () {},
////        ),
//      ],
//    );
//  }
//
//  void sendMessage() {
//    BlocProvider.of<ChatBloc>(context).add(
//        SendTextMessageEvent(message: textEditingController.text, to: widget.user));
//    textEditingController.clear();
//  }
//
//  _buildMessageComposer() {
//    return Container(
//      padding: EdgeInsets.symmetric(horizontal: 8.0),
//      height: 70.0,
//      color: Colors.white,
//      child: Row(
//        children: <Widget>[
//          IconButton(
//            icon: Icon(Icons.face),
//            iconSize: 25.0,
//            color: Theme.of(context).primaryColor,
//            onPressed: () {},
//          ),
//          Expanded(
//            child: TextField(
//              textCapitalization: TextCapitalization.sentences,
//              onChanged: (value) {},
//              controller: textEditingController,
//              decoration: InputDecoration.collapsed(
//                hintText: S.of(context).typeAMessage,
//                hintStyle: TextStyle(color: appTheme().primaryColor),
//              ),
//            ),
//          ),
//          IconButton(
//            icon: Icon(Icons.send),
//            iconSize: 25.0,
//            color: Theme.of(context).primaryColor,
//            onPressed: () => sendMessage(),
//          ),
//        ],
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: BlocListener<ChatBloc, ChatState>(
//        listener: (context, state) {
//          if (state is ChatErrorState){
//            print(state.error);
////            _showSnackBar(state.error, Colors.red);
//          }
//        },
//        child: GestureDetector(
//          onTap: () => FocusScope.of(context).unfocus(),
//          child: Column(
//            children: <Widget>[
//              SizedBox(
//                height: 10.0,
//              ),
//              Expanded(
//                child: Container(
//                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
//                    decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.only(
//                            topLeft: Radius.circular(30.0),
//                            topRight: Radius.circular(30.0)
//                        )
//                    ),
//                    child: ClipRRect(
//                      borderRadius: BorderRadius.only(
//                          topLeft: Radius.circular(30.0),
//                          topRight: Radius.circular(30.0)
//                      ),
//                      child: BlocBuilder<ChatBloc, ChatState>(
//                        builder: (context, state){
//                          if (state is ChatEmptyState){
//                            BlocProvider.of<ChatBloc>(context).add(FetchChatListEvent(widget.user.id));
//                          }
//
//                          if (state is ChatSendingState){
//                            return SendingCard(text: "sending",);
////                        return Center(child: Text("Sending message", style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,));
//                          }
//
//                          if (state is FetchedChatListState)
//                            messages = state.chatList;
//                          return ListView.builder(
//                              reverse: true,
//                              padding: EdgeInsets.only(top: 14.0),
//                              itemCount: messages.length,
//                              itemBuilder: (BuildContext context, int index) {
//                                final ChatModel message = messages[index];
//                                final bool isMe = message.toOrFrom == widget.user.id;
//                                return _buildMessage(message, isMe);
//                              }
//                          );
//                        },
//                      ),
//                    )
//                ),
//              ),
//              _buildMessageComposer(),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//
////////import 'package:flutter/material.dart';
////////import 'package:flutter_chat/models/message_model.dart';
////////import 'package:flutter_chat/models/user_model.dart';
////////
////////class ChatScreen extends StatefulWidget {
////////  final User user;
////////
////////  ChatScreen({this.user});
////////
////////  @override
////////  _ChatScreenState createState() => _ChatScreenState();
////////}
////////
////////class _ChatScreenState extends State<ChatScreen> {
////////
////////  _buildMessage(Message message, bool isMe){
////////    final Container msg = Container(
////////      width: MediaQuery.of(context).size.width * 0.75,
////////      margin: isMe
////////          ? EdgeInsets.only(top: 7.0, bottom: 8.0, left: 80.0)
////////          : EdgeInsets.only(top:8.0, bottom: 8.0),
////////      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
////////      decoration: isMe ? BoxDecoration(
////////          color: Theme.of(context).accentColor,
////////          borderRadius: BorderRadius.only(
////////              topLeft: Radius.circular(15.0),
////////              bottomLeft: Radius.circular(15.0),
////////              topRight: Radius.circular(15.0)
////////          )
////////      ) : BoxDecoration(
////////          color: Color(0xFFe4f1fe),
////////          borderRadius: BorderRadius.only(
////////              topLeft: Radius.circular(15.0),
////////              topRight: Radius.circular(15.0),
////////              bottomRight: Radius.circular(15.0)
////////          )
////////      ),
////////      child: Column(
////////        crossAxisAlignment: CrossAxisAlignment.start,
////////        children: <Widget>[
////////          Text(
////////            message.time,
////////            style: TextStyle(
////////                color: Colors.blueGrey,
////////                fontSize: 13.0,
////////                fontWeight: FontWeight.w600
////////            ),
////////          ),
////////          SizedBox(height: 8.0,)
////////          ,       Text(
////////              message.text,
////////              style: TextStyle(
////////                  color: Colors.blueGrey,
////////                  fontSize: 13.0,
////////                  fontWeight: FontWeight.w600
////////              )
////////          ),
////////        ],
////////      ),
////////    );
////////    if (isMe){
////////      return msg;
////////    }
////////    return Row(
////////      children: <Widget>[
////////        msg,
////////        IconButton(
////////          icon: message.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
////////          iconSize: 30.0,
////////          color: message.isLiked ? Colors.red : Colors.blueGrey,
////////          onPressed: () {},
////////        ),
////////      ],
////////    );
////////  }
////////
////////  _buildMessageComposer() {
////////    return Container(
////////      padding: EdgeInsets.symmetric(horizontal: 8.0),
////////      height: 70.0,
////////      color: Colors.white,
////////      child: Row(
////////        children: <Widget>[
////////          IconButton(
////////            icon: Icon(Icons.photo),
////////            iconSize: 25.0,
////////            color: Theme.of(context).primaryColor,
////////            onPressed: () {},
////////          ),
////////          Expanded(
////////            child: TextField(
////////              textCapitalization: TextCapitalization.sentences,
////////              onChanged: (value) {},
////////              decoration: InputDecoration(
////////                  hintText: 'Send a message..'
////////              ),
////////            ),
////////          ),
////////          IconButton(
////////            icon: Icon(Icons.send),
////////            iconSize: 25.0,
////////            color: Theme.of(context).primaryColor,
////////            onPressed: () {},
////////          ),
////////        ],
////////      ),
////////    );
////////  }
////////
////////  @override
////////  Widget build(BuildContext context) {
////////    return Scaffold(
////////      backgroundColor: Theme.of(context).primaryColor,
////////      appBar: AppBar(
////////        title: Text(
////////          widget.user.name,
////////          style: TextStyle(
////////              fontSize: 20.0,
////////              fontWeight: FontWeight.bold
////////          ),
////////        ),
////////        centerTitle: true,
////////        elevation: 0.0,
////////        actions: <Widget>[
////////          IconButton(
////////            icon: Icon(Icons.more_horiz),
////////            iconSize: 30.0,
////////            color: Colors.white,
////////            onPressed: () {},
////////          ),
////////        ],
////////      ),
////////      body: GestureDetector(
////////        onTap: () => FocusScope.of(context).unfocus(),
////////        child: Column(
////////          children: <Widget>[
////////            SizedBox(
////////              height: 10.0,
////////            ),
////////            Expanded(
////////              child: Container(
////////                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
////////                  decoration: BoxDecoration(
////////                      color: Colors.white,
////////                      borderRadius: BorderRadius.only(
////////                          topLeft: Radius.circular(30.0),
////////                          topRight: Radius.circular(30.0)
////////                      )
////////                  ),
////////                  child: ClipRRect(
////////                    borderRadius: BorderRadius.only(
////////                        topLeft: Radius.circular(30.0),
////////                        topRight: Radius.circular(30.0)
////////                    ),
////////                    child: ListView.builder(
////////                        reverse: true,
////////                        padding: EdgeInsets.only(top: 14.0),
////////                        itemCount: messages.length,
////////                        itemBuilder: (BuildContext context, int index) {
////////                          final Message message = messages[index];
////////                          final bool isMe = message.sender.id == currentUser.id;
////////                          return _buildMessage(message, isMe);
////////                        }
////////                    ),
////////                  )
////////              ),
////////            ),
////////            _buildMessageComposer(),
////////          ],
////////        ),
////////      ),
////////    );
////////  }
////////}
//////
//////
//////// chat list ///////////
//////
//////import 'package:flutter/material.dart';
//////
//////// Documentaion used:
//////// ListTile - https://api.flutter.dev/flutter/material/ListTile-class.html
//////// https://api.flutter.dev/flutter/widgets/FittedBox-class.html
//////// https://api.flutter.dev/flutter/material/Card-class.html
//////// I originally used ListTile but that was promblematic
//////
//////class ChatList extends StatelessWidget {
//////  @override
//////  Widget build(BuildContext context) {
//////    return ListView(
//////      children: <Widget>[
//////        Padding(
//////          padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
//////          child: Row(
//////            children: <Widget>[
//////              Expanded(
//////                child: Text(
//////                  'Messages',
//////                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//////                ),
//////              ),
//////              InkWell(
//////                onTap: () {},
//////                child: Padding(
//////                    padding: EdgeInsets.all(20.0), child: Icon(Icons.search)),
//////              )
//////            ],
//////          ),
//////        ),
//////        _ChatItem(
//////            'Bushra Martinez',
//////            'https://cdn-images-1.medium.com/max/1200/1*3X2tLj85Jfq3dlGxWqQ4TA.png',
//////            7,
//////            true,
//////            'On my way to the gym but I need to go to the supplement store to buy some BCAAs. On my way to the gym but I needed to stop at the supplement store to buy some BCAAs On my way to the gym but I needed to stop by the supplement store to buy some BCAAs.'),
//////        _ChatItem(
//////            'Zainab Khan',
//////            'https://www.thenational.ae/image/policy:1.696524:1516870898/DTrCaEnXUAAIGi2.jpg?f=16x9&w=1200',
//////            2,
//////            false,
//////            'Rahhhh... I saw u with bushra'),
//////        _ChatItem(
//////            'Kylie Jenner',
//////            'https://pbs.twimg.com/profile_images/1114924576679424000/budLZeGp_400x400.jpg',
//////            0,
//////            true,
//////            'Great seeing you. I have to go now. I\'ll talk to you later.'),
//////        _ChatItem(
//////            'Chloe Sims',
//////            'https://modelstudents.co.uk/assets/models/176/176-profile-image-1525428232-thumb.jpg',
//////            0,
//////            false,
//////            'Please follow me on insta x'),
//////        _ChatItem(
//////            'Stefflon Don',
//////            'http://hdqwalls.com/wallpapers/stefflon-don-9o.jpg',
//////            0,
//////            false,
//////            'Why haven\'t aliens visited our solar system? They looked at the reviews and we only have one star.'),
//////        _ChatItem(
//////            'kim kardashian',
//////            'https://akns-images.eonline.com/eol_images/Entire_Site/2017618/rs_765x1024-170718174545-765.Kim-Kardashian-Mascara.jl.071817.jpg?fit=inside|900:auto&output-quality=90',
//////            0,
//////            false,
//////            'Please follow me on insta x'),
//////        Padding(
//////          padding: EdgeInsets.only(top: 40.0, bottom: 10),
//////          child: Text(
//////            'no more messages',
//////            style: TextStyle(color: Colors.grey[350]),
//////            textAlign: TextAlign.center,
//////          ),
//////        )
//////      ],
//////    );
//////  }
//////}
//////
//////class _ChatItem extends StatelessWidget {
//////  final String imgURL, name, message;
//////  final int unread;
//////  final bool active;
//////
//////  _ChatItem(this.name, this.imgURL, this.unread, this.active, this.message);
//////
//////  Widget _activeIcon(isActive) {
//////    if (isActive) {
//////      return ClipRRect(
//////        borderRadius: BorderRadius.circular(8),
//////        child: Container(
//////          padding: EdgeInsets.all(3),
//////          width: 16,
//////          height: 16,
//////          color: Colors.white,
//////          child: ClipRRect(
//////            borderRadius: BorderRadius.circular(5),
//////            child: Container(
//////              color: Color(0xff43ce7d), // flat green
//////            ),
//////          ),
//////        ),
//////      );
//////    } else {
//////      return Container();
//////    }
//////  }
//////
//////  @override
//////  Widget build(BuildContext context) {
//////    return InkWell(
//////      onTap: () {},
//////      child: Padding(
//////        padding: EdgeInsets.all(20),
//////        child: Row(
//////          crossAxisAlignment: CrossAxisAlignment.start,
//////          children: <Widget>[
//////            Container(
//////              margin: EdgeInsets.only(right: 12.0),
//////              child: Stack(
//////                children: <Widget>[
//////                  InkWell(
//////                    onTap: () {
//////                      print('You want to see the display pictute.');
//////                    },
//////                    child: CircleAvatar(
//////                      backgroundImage: NetworkImage(this.imgURL),
//////                      radius: 30.0,
//////                    ),
//////                  ),
//////                  Positioned(
//////                    right: 0,
//////                    bottom: 0,
//////                    child: _activeIcon(active),
//////                  ),
//////                ],
//////              ),
//////            ),
//////            Expanded(
//////              child: Padding(
//////                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
//////                  child: Column(
//////                    crossAxisAlignment: CrossAxisAlignment.start,
//////                    children: <Widget>[
//////                      Text(
//////                        this.name,
//////                        style: TextStyle(fontSize: 18),
//////                      ),
//////                      Container(
//////                        margin: EdgeInsets.only(top: 4.0),
//////                        child: Text(this.message,
//////                            style: TextStyle(
//////                                color: Colors.grey, fontSize: 15, height: 1.1),
//////                            maxLines: 2,
//////                            overflow: TextOverflow.ellipsis),
//////                      )
//////                    ],
//////                  )),
//////            ),
//////            Column(
//////              children: <Widget>[
//////                Text('15 min', style: TextStyle(color: Colors.grey[350])),
//////                _UnreadIndicator(this.unread),
//////              ],
//////            )
//////          ],
//////        ),
//////      ),
//////    );
//////  }
//////}
//////
//////class _UnreadIndicator extends StatelessWidget {
//////  final int unread;
//////
//////  _UnreadIndicator(this.unread);
//////
//////  @override
//////  Widget build(BuildContext context) {
//////    if (unread == 0) {
//////      return Container(); // return empty container
//////    } else {
//////      return Padding(
//////          padding: EdgeInsets.only(top: 8.0),
//////          child: ClipRRect(
//////              borderRadius: BorderRadius.circular(10),
//////              child: Container(
//////                height: 30,
//////                color: Color(0xff3e5aeb),
//////                width: 30,
//////                padding: EdgeInsets.all(0),
//////                alignment: Alignment.center,
//////                child: Text(
//////                  unread.toString(),
//////                  style: TextStyle(
//////                      fontWeight: FontWeight.bold, color: Colors.white),
//////                ),
//////              )));
//////    }
//////  }
//////}
////
////
////import 'package:dsapp/blocs/blocs.dart';
////import 'package:dsapp/generated/l10n.dart';
////import 'package:dsapp/models/chat/chat.dart';
////import 'package:dsapp/screens/chat/components/chat-card.dart';
////import 'package:dsapp/screens/screens.dart';
////import 'package:flutter/material.dart';
////import 'package:flutter_bloc/flutter_bloc.dart';
////import 'package:flutter_svg/flutter_svg.dart';
////
////class ChatScreen extends StatelessWidget {
////  final GroupModel groupModel;
////
////  const ChatScreen({Key key, this.groupModel}) : super(key: key);
////
////  @override
////  Widget build(BuildContext context) {
////    return BlocListener<ChatBloc, ChatState>(
////      listener: (context, state) {
////        if (state is ChatErrorState){
////          print(state.error);
//////          context.hideLoaderOverlay();
////          showDialog(
////              context: context,
////              builder: (_) => ErrorDialog(errorMessage: state.error,),
////              barrierDismissible: false
////          );
////        }
////      },
////      child: SafeArea(
////        child: Padding(
////          padding: EdgeInsets.all(20.0),
////          child: BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
////            if (state is UsersLoadedState) {
////              if(state.users.length == 0){
////                return Center(
////                  child: Icon(
////                    Icons.do_not_disturb,
////                    size: 50.0,
////                    color: Colors.black,
////                    semanticLabel: "No person available for chat",
////                  ),
////                );
////              }else{
////                return Column(
////                  children: [
////                    Row(
////                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
////                      children: [
////                        SvgPicture.asset(
////                          "assets/icons/Edit.svg",
////                          width: 20,
////                          height: 20,
////                        ),
////                        Icon(Icons.search)
////                      ],
////                    ),
////                    SizedBox(
////                      height: 10.0,
////                    ),
////                    Expanded(
////                      child: ListView.builder(
////                          itemCount: state.users.length,
////                          itemBuilder: (context, index) {
////                            return ChatList(
////                              user: state.users[index],
////                            );
////                          }),
////                    ),
////                  ],
////                );
////              }
////            }
////
////            if (state is ChatLoadingState){
//////                context.showLoaderOverlay();
////              return Center(child: Text(S.of(context).loading, style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,));
//////                  return CircularProgressIndicator();
////            }
////
////            if (state is ChatEmptyState) {
////              BlocProvider.of<ChatBloc>(context)
////                  .add(FetchingUsersInGroupsEvent(group: groupModel));
////            }
////            return Center(
////              child: CircularProgressIndicator(),
////            );
////          }),
////        ),
////      ),
////    );
////  }
////}

//InkWell(
//onTap: () => Navigator.pushNamed(context, ConversationPage.routeName,
//arguments: user),
//child: Row(
//crossAxisAlignment: CrossAxisAlignment.start,
////        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: <Widget>[
//Container(
//margin: EdgeInsets.only(right: 12.0),
//child: Stack(
//children: <Widget>[
//InkWell(
//onTap: () {
//print('You want to see the display pictute.');
//},
//child: this.user.picture != null ? CircleAvatar(
//backgroundImage: NetworkImage(this.user.picture),
//radius: 30.0,
//) : CircleAvatar(
//child: SvgPicture.asset(
//"assets/images/menu/Profile.svg",
//width: 30,
//height: 30,
//),
//),
//)
//],
//),
//),
//Expanded(
//child: Padding(
//padding: EdgeInsets.only(left: 6.0, right: 6.0),
//child: Column(
//children: <Widget>[
//Align(
//alignment: Alignment.bottomCenter,
//child: Text(
//this.user.getFullName,
//style: TextStyle(fontSize: 18),
//),
//),
//],
//)),
//),
//Icon(
//Icons.arrow_forward_ios,
//size: 20.0,
//color: Colors.black,
//),
//],
//),
//);