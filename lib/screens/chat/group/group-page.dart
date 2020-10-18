import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens.dart';

class GroupPage extends StatelessWidget {
  static const routeName = '/chat';
  @override
  Widget build(BuildContext context) {
    final MenuArguments arguments = ModalRoute.of(context).settings.arguments;
    final ChatRepository repository = ChatRepository(chatService: ChatService());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Exams",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: BlocProvider(
        create: (context) => ChatBloc(repository: repository),
        child: GroupsScreen(user: arguments.roleModules,),
      ),
    );
  }
}
