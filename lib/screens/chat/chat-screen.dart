import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/chat/chat.dart';
import 'package:dsapp/screens/chat/components/chat-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatelessWidget {
  final GroupModel groupModel;

  const ChatScreen({Key key, this.groupModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) {},
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
            if (state is UsersLoadedState) {
              return Column(
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
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          return ChatList(
                            user: state.users[index],
                          );
                        }),
                  ),
                ],
              );
            }
            if (state is ChatEmptyState) {
              BlocProvider.of<ChatBloc>(context)
                  .add(FetchingUsersInGroupsEvent(group: groupModel));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
        ),
      ),
    );
  }
}
