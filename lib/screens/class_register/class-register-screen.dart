import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/class_register/components/class-register-card.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassRegisterScreen extends StatefulWidget {
  final RoleModules user;

  const ClassRegisterScreen({Key key, this.user}) : super(key: key);

  @override
  _ClassRegisterScreenState createState() => _ClassRegisterScreenState();
}

class _ClassRegisterScreenState extends State<ClassRegisterScreen> {
  bool isTeacher;
  int _value = 1;
  int _scheduleValue = 1;
  var schoolClasses = List<SchoolClassModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isTeacher = widget.user.role == "ENSEINGNANT";
  }
  @override
  Widget build(BuildContext context) {
    if(!isTeacher){
      schoolClasses.add(widget.user.school.studentClass);
    }
    List<DropdownMenuItem> buildDropDownItems({List<TimeTableModel> schedules,}) {
      final children = <DropdownMenuItem>[];

      for (int i = 0; i < schedules.length; i++) {
        children.add(DropdownMenuItem(
          child: Text(schedules[i].subject.name),
          value: i+1,
        ));
      }
      return children;
    }
    List<DropdownMenuItem> buildDropDownClassesItems({List<SchoolClassModel> classes}) {
      final children = <DropdownMenuItem>[];

      for (int i = 0; i < classes.length; i++) {
        children.add(DropdownMenuItem(
          child: Text(classes[i].name),
          value: i+1,
        ));
      }
      return children;
    }
    void _showSuccess(String success) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(success),
        backgroundColor: Theme.of(context).splashColor,
      ));
    }

    String studentClass (){
      if (widget.user.user.studentClass != null){
        return widget.user.user.studentClass?.id.toString();
      }
      return widget.user.school.studentClass?.id.toString();
    }

    return BlocListener<ClassRegisterBloc, ClassRegisterState>(
      listener: (context, state) {
        if (state is ClassRegisterSavedState){
         _showSuccess("Class register successfully saved");
        }
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
          child: BlocBuilder<ClassRegisterBloc, ClassRegisterState>(
          builder: (context, state) {
            if (state is ClassRegisterEmptyState || state is ClassRegisterSavedState) {
             isTeacher ? BlocProvider.of<ClassRegisterBloc>(context)
                 .add(SchoolClassDropdownEventEvent(classId: widget.user.school.teacherClasses[0].id.toString()))
             : BlocProvider.of<ClassRegisterBloc>(context)
                 .add(SchoolClassDropdownEventEvent(classId: widget.user.school.studentClass.id.toString()));
            }
            if (state is ClassRegisterLoadedState || state is ClassRegisterToggledState){
              List<UserModel> users= state is ClassRegisterLoadedState ? state.users : (state as ClassRegisterToggledState).users;
              List<TimeTableModel> schedules= state is ClassRegisterLoadedState ? state.schedules : (state as ClassRegisterToggledState).schedules;
              TimeTableModel selectedSchedule= state is ClassRegisterLoadedState ? state.selectedSchedules : (state as ClassRegisterToggledState).selectedSchedules;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: appTheme().backgroundColor,
                    child: DropdownButton(
                        value: _value,
                        items: isTeacher ? buildDropDownClassesItems(classes: widget.user.school.teacherClasses) : buildDropDownClassesItems(classes: schoolClasses),
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                          isTeacher ? BlocProvider.of<ClassRegisterBloc>(context)
                              .add(SchoolClassDropdownEventEvent(
                              classId: widget.user.school.teacherClasses[_value-1].id.toString()))
                          : BlocProvider.of<ClassRegisterBloc>(context)
                              .add(SchoolClassDropdownEventEvent(
                              classId: schoolClasses[_value-1].id.toString()));
                        }),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: appTheme().backgroundColor,
                        padding: EdgeInsets.all(20.0),
                        child: DropdownButton(
                            value: _scheduleValue,
                            items: buildDropDownItems(schedules : schedules),
                            onChanged: (value) {
                              setState(() {
                                _scheduleValue = value;
                              });
                              BlocProvider.of<ClassRegisterBloc>(context)
                                  .add(ClassRegisterFilterByScheduleEvent(
                                  tableModel: schedules[_scheduleValue -
                                      1],
                                  classId: studentClass()));
                            }),

                      ),
                      Text(selectedSchedule.startTime + " - " + selectedSchedule.endTime),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index){
                          return ClassRegisterCard(user: users[index], classSchedule: selectedSchedule.id);
                        },
                      ),
                    ),
                  )
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          ),
        ),
      ),
    );
  }
}
