import 'dart:convert';

import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/menu/components/menu-card-component.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParentStudentMenuScreen extends StatefulWidget {
  final Module module;

  ParentStudentMenuScreen({this.module});

  @override
  _ParentStudentMenuScreenState createState() => _ParentStudentMenuScreenState();
}

class _ParentStudentMenuScreenState extends State<ParentStudentMenuScreen> {
  LocalStorage prefs = LocalStorage();
  @override
  void initState() {
    prefs.setSharedPreference('studentUser', json.encode(UserModel.toJson(widget.module.studentUser)));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return BlocListener<MenuBloc, MenuState>(
      listener: (context, state) {},
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 30.0),
            child: BlocBuilder<MenuBloc, MenuState>(
              builder: (context, state){
                if(state is MenuSuccess){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(widget.module.description, style: TextStyle(fontSize: 20.0),),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.modules.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1,),
                        itemBuilder: (context, index) {
                          return MenuCard(menu: state.modules[index], roleModules: state.roleModules,);
                        },
                      ),
                    ],
                  );
                }
                if (state is MenuInitial){
                  BlocProvider.of<MenuBloc>(context)
                      .add(MenuDropDownSelected(role: "STUDENT"));
                }
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
