import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/chat/chat.dart';
import 'package:dsapp/screens/chat/components/chat-card.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  final GroupModel groupModel;

  const ChatScreen({Key key, this.groupModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void initPage() {
      BlocProvider.of<ChatBloc>(context)
          .add(FetchingUsersInGroupsEvent(group: groupModel));
    }

    void goBack() {
      initPage();
      Navigator.pop(context);
    }

    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state is ChatErrorState) {
          showDialog(
              context: context,
              builder: (_) => ErrorDialog(
                    errorMessage: state.error,
                    onButtonPressed: goBack,
                  ),
              barrierDismissible: false);
        }
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state is UsersLoadedState) {
                if (state.users.length == 0) {
                  return Center(
                    child: Icon(
                      Icons.do_not_disturb,
                      size: 50.0,
                      color: Colors.black,
                      semanticLabel: "No person available for chat",
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: state.users.length,
                            itemBuilder: (context, index) {
                              return ChatItem(
                                user: state.users[index],
                              );
                            }),
                      ),
                    ],
                  );
                }
              }

              if (state is ChatLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ChatEmptyState) {
                initPage();
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
