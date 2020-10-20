import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/chat/components/chat-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationScreen extends StatefulWidget {
  final UserModel userModel;

  const ConversationScreen({Key key, this.userModel}) : super(key: key);
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final ScrollController listScrollController =  ScrollController();

  List<ChatModel> messages = List();

  @override
  void initState() {
//    BlocProvider.of<ChatBloc>(context).add(FetchChatListEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height*0.79,
                child: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state){
                    if (state is ChatEmptyState){
                      BlocProvider.of<ChatBloc>(context).add(FetchChatListEvent(widget.userModel.id));
                    }
                    if (state is FetchedChatListState)
                      messages = state.chatList;
                    return ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      itemBuilder: (context, index) => MessageCard(message: messages[index]),
                      itemCount: messages.length,
                      reverse: true,
                      controller: listScrollController,
                    );
                  },
                ),
              ),
            ),
            InputWidget(user: widget.userModel.id,),
          ],
        ),

    );
  }
}
