import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/chat/components/chat-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
//    loading = false;
  }

  void _showSnackBar(String message, Color color) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is ChatErrorState){
            print(state.error);
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
                      BlocProvider.of<ChatBloc>(context).add(FetchChatListEvent(widget.user.id));
                    }

                    if (state is ChatSendingState){
                      return SendingCard(text: "sending",);
//                        return Center(child: Text("Sending message", style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,));
                    }

                    if (state is FetchedChatListState){
//                      messages = state.chatList;
                    return StreamBuilder<QuerySnapshot>(
                      stream: state.chatList,
                      builder: (context, snapshot) {
                        messages = snapshot.data.docs;
                        return ListView.builder(
                          padding: EdgeInsets.all(10.0),
                          itemBuilder: (context, index) => ChatCard(message: messages[index], userId: state.userId,),
                          itemCount: messages.length,
                          reverse: true,
                          controller: listScrollController,
                        );
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
