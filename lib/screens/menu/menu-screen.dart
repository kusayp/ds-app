import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/menu/components/menu-card-component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuScreen extends StatefulWidget {
  final UserModel user;
  final List<SchoolModel> schools;

  MenuScreen({this.user, this.schools});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int initialValue = 1;
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> buildDropDownItems() {
      final children = <DropdownMenuItem>[];

      for (int i = 0; i < widget.schools.length; i++) {
        children.add(DropdownMenuItem(
          child: Text(widget.schools[i].name),
          value: i+1,
        ));
      }
      return children;
    }
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
                              Text(widget.user.firstName + ' ' + widget.user.lastName, style: TextStyle(fontSize: 20.0),),
                              Icon(Icons.notifications_active)
                            ],
                          ),
                        ),
                        Container(
                          child: DropdownButton(value: initialValue, items: buildDropDownItems(), onChanged: (value){
                            print(value);
                            setState(() {
                              initialValue = value;
                            });
                            BlocProvider.of<MenuBloc>(context)
                                .add(MenuDropDownSelected(school: widget.schools[value-1]));
                          }
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.modules.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1,),
                          itemBuilder: (context, index) {
                            return MenuCard(menu: state.modules[index]);
                          },
                        ),
                      ],
                    );
                  }
                  if (state is MenuInitial){
                    print("Empty bloc");
                    BlocProvider.of<MenuBloc>(context)
                        .add(MenuDropDownSelected(school: widget.schools[initialValue-1]));
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
