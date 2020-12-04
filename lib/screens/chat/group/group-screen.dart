import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/exams/components/exams-card.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:loader_overlay/loader_overlay.dart';

class GroupsScreen extends StatefulWidget {
  final RoleModules user;

  const GroupsScreen({Key key, this.user}) : super(key: key);

  @override
  _GroupsScreenState createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  int _value = 1;
  bool isTeacher;
  var schoolClasses = List<SchoolClassModel>();
  bool hasClass;

  @override
  void initState() {
    super.initState();
    isTeacher = widget.user.role == "ENSEINGNANT";
    hasClass = widget.user.school.teacherClasses.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    if (!isTeacher) {
      schoolClasses.add(widget.user.school.studentClass);
    }

    List<DropdownMenuItem> buildDropDownClassesItems(
        {List<SchoolClassModel> classes}) {
      final children = <DropdownMenuItem>[];

      for (int i = 0; i < classes.length; i++) {
        children.add(DropdownMenuItem(
          child: Text(classes[i].name),
          value: i + 1,
        ));
      }
      return children;
    }

    Widget generateGroupsContent(ChatLoadedState state) {
      if (state.groupPageData.result.length == 0) {
        return Center(
          child: Icon(
            Icons.do_not_disturb,
            size: 50.0,
            color: Colors.black,
            semanticLabel: "No Data Found",
          ),
        );
      }
      else {
        return Expanded(
          child: ListView.builder(
            itemCount: state.groupPageData.result.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              GroupModel groupModel = GroupModel(
                id: state.groupPageData.result[index].id,
                name: state.groupPageData.result[index].name,
                subject: state.groupPageData.result[index].subject,
                limit: state.groupPageData.result[index].limit,
                classId: state.classId,
              );
              return GroupCard(
                group: groupModel,
              );
            },
          ),
        );
      }
    }

    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state is ChatErrorState) {
          print(state.error);
//          context.hideLoaderOverlay();
          showDialog(
              context: context,
              builder: (_) => ErrorDialog(
                    errorMessage: state.error,
                  ),
              barrierDismissible: false);
        }
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state is ChatLoadedState) {
//                context.hideLoaderOverlay();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: appTheme().backgroundColor,
                      child: DropdownButton(
                          value: _value,
                          items: isTeacher
                              ? buildDropDownClassesItems(
                              classes: widget.user.school.teacherClasses)
                              : buildDropDownClassesItems(classes: schoolClasses),
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                            isTeacher
                                ? BlocProvider.of<ChatBloc>(context).add(
                                FetchingGroupsInClassEvent(
                                    classId: widget
                                        .user.school.teacherClasses[_value - 1].id
                                        .toString(),
                                    userId: widget.user.user.id.toString()))
                                : BlocProvider.of<ChatBloc>(context).add(
                                FetchingGroupsInClassEvent(
                                    classId: schoolClasses[_value - 1].id.toString(),
                                    userId: widget.user.user.id.toString()));
                          }),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      child: generateGroupsContent(state),
                    ),
                  ],
                );
              }

              if (state is ChatEmptyState) {
                isTeacher
                    ? BlocProvider.of<ChatBloc>(context).add(
                        FetchingGroupsInClassEvent(
                            classId: hasClass ? widget?.user?.school?.teacherClasses[0].id
                                .toString() : null,
                            userId: widget?.user?.user?.id?.toString()))
                    : BlocProvider.of<ChatBloc>(context).add(
                        FetchingGroupsInClassEvent(
                            classId:
                                widget.user?.school?.studentClass?.id?.toString(),
                            userId: widget?.user?.user?.id?.toString()));
              }

              if (state is ChatLoadingState) {
//                context.showLoaderOverlay();
                return Center(
                    child: Text(
                  S.of(context).loading,
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ));
//                  return CircularProgressIndicator();
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}
