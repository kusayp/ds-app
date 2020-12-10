import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/chat/components/chat-card.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ConversationScreen extends StatefulWidget {
  final UserModel user;

  const ConversationScreen({Key key, this.user}) : super(key: key);
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final ScrollController listScrollController =  ScrollController();
  bool loading = false;

  List<QueryDocumentSnapshot> messages = List();

  @override
  void initState() {
    super.initState();
  }

  void _showSnackBar(String message, Color color) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }

  void initPage() {
    BlocProvider.of<ChatBloc>(context).add(FetchChatListEvent(widget.user.id));
  }

  Widget timeGroup(String date){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: appTheme().primaryColor,
      ),
      width: MediaQuery.of(context).size.width *0.20,
      padding: EdgeInsets.all(5.0),
      child: Text(date, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is ChatErrorState){
            initPage();
            _showSnackBar(state.error, Colors.red);
          }
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height*0.79,
                child: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state){
                    if (state is ChatEmptyState){
                      initPage();
                    }

                    if (state is ChatSendingState){
                      return Center(child: CircularProgressIndicator(),);
                    }

                    if (state is FetchedChatListState){
                    return StreamBuilder<QuerySnapshot>(
                      stream: state.chatList,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                          child: CircularProgressIndicator(
                          valueColor:
                          AlwaysStoppedAnimation<Color>(appTheme().accentColor)));
                        } else {
                          messages = snapshot.data.docs;
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                            child: GroupedListView<dynamic, String>(
                              padding: EdgeInsets.all(10.0),
                              elements: messages,
                              groupBy: (element) => DateFormat('dd MMM yy').format(DateTime.fromMillisecondsSinceEpoch(element['timestamp'].millisecondsSinceEpoch)),
                              groupSeparatorBuilder: (String groupByValue) => timeGroup(groupByValue),
                              itemBuilder: (context, dynamic element) => ChatCard(message: element,
                                userId: state.userId,),
                              useStickyGroupSeparators: true, // optional
                              floatingHeader: true, // optional
                              order: GroupedListOrder.ASC, // optional
                              reverse: true,
                              controller: listScrollController,
                            ),
                          );
                        }
                      }
                    );
                  }
                    return Container();
                  }
                ),
              ),
            ),
            InputWidget(user: widget.user, loading: loading,),
          ],
        ),
      ),

    );
  }
}
