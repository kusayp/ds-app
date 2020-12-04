import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dsapp/screens/screens.dart';

class NotificationScreen extends StatelessWidget {
  final String school;

  NotificationScreen({this.school});

  Widget build(BuildContext context) {

    return BlocListener<MenuBloc, MenuState>(
      listener: (context, state) {},
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 30.0),
            child: BlocBuilder<MenuBloc, MenuState>(
              builder: (context, state) {
                if (state is NotificationSuccess) {
                  if(state.notifications.isEmpty){
                    return Center(
                      child: Text(S.of(context).noNotificationsReceived),
                    );
                  }else{
                  return ListView.builder(
                    itemCount: state.notifications.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index){
                      return NotificationCard(notification: state.notifications[index],);
                    },
                  );
                  }
                }
                if (state is MenuInitial)
                  BlocProvider.of<MenuBloc>(context)
                      .add(NotificationIconClicked(school: school));
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

}
