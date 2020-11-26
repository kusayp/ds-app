import 'dart:io';

import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/common.dart';
import 'package:dsapp/utils/style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAssignmentScreen extends StatefulWidget {
  final SchoolModel school;
  final UserModel user;
  final MenuArguments arguments;

  const AddAssignmentScreen({Key key, this.school, this.user, this.arguments}) : super(key: key);
  @override
  _AddAssignmentScreenState createState() => _AddAssignmentScreenState();
}

class _AddAssignmentScreenState extends State<AddAssignmentScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _validate = false;
  DateTime selectedDate;
  String _filename;
  int classId;
  int subjectId;
  bool hasClass;

  int _value = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hasClass = widget?.user?.school?.teacherClasses?.isNotEmpty;
//    classId = widget.school.teacherClasses[_value-1].id;
//    subjectId = widget.school.subjects[_value-1].id;
  }
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> buildDropDownItems({List<SchoolClassModel> classes,}) {
      final children = <DropdownMenuItem>[];

      for (int i = 0; i < classes.length; i++) {
        children.add(DropdownMenuItem(
          child: SizedBox(
            width: 100.0,
            child: Text(classes[i].name),
          ),
          value: i+1,
        ));
      }
      return children;
    }

    List<DropdownMenuItem> buildDropDownSubjectItems({List<SubjectModel> subjects,}) {
      final children = <DropdownMenuItem>[];

      for (int i = 0; i < subjects.length; i++) {
        children.add(DropdownMenuItem(
          child: Text(subjects[i].name),
          value: i+1,
        ));
      }
      return children;
    }
    void saveAssignment(){

        BlocProvider.of<AddAssignmentBloc>(context).add(ClassAssignmentSaveEvent(
            title: _titleController.text, dueDate: selectedDate, description: _descriptionController.text, classId: classId, subjectId: subjectId, teacherId: widget.user.id));

    }

    void openFileExplorer() async {
      FilePickerResult result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc'],
      );

      if(result != null) {
        File file = File(result.files.single.path);
        print(file.path);
        setState(() {
          _filename = result.files.single.name;
          print(_filename);
        });
      }
    }

    _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate:  selectedDate != null ? selectedDate : DateTime.now(), // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
        initialEntryMode: DatePickerEntryMode.input,
      );
      if (picked != null)
        setState(() {
          selectedDate = picked;
          _dateController
            ..text = Common.formatDate(selectedDate.millisecondsSinceEpoch)
          ..selection  = TextSelection.fromPosition(TextPosition(offset: _dateController.text.length, affinity: TextAffinity.upstream))
          ;
        });
    }

    void _showSnackBar(String success, Color color) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(success),
        backgroundColor: color,
      ));
    }

    return SafeArea(
      child: BlocListener<AddAssignmentBloc, AddAssignmentState>(
        listener: (context, state) {
          if (state is AddAssignmentErrorState){
            print(state.errorMessage);
//          context.hideLoaderOverlay();
            showDialog(
                context: context,
                builder: (_) => ErrorDialog(errorMessage: state.errorMessage,),
                barrierDismissible: false
            );
          }

          if (state is AssignmentSavedState){
            _showSnackBar("Assignment score successfully saved", Colors.green);
          }
        },
        child: BlocBuilder<AddAssignmentBloc, AddAssignmentState>(
        builder: (context, state) {
          if(state is AddAssignmentEmptyState){
            return Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20, right: 20, left: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: CustomShortField(
                            width: (MediaQuery.of(context).size.width - 90) / 2,
                            labelText: "Title",
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                  color: appTheme().primaryColor, width: 1.0),
                            ),
                            formField: TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10.0),
                                  border: InputBorder.none),
                              controller: _titleController,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Flexible(
                          child: CustomShortField(
                            width: (MediaQuery.of(context).size.width - 90) / 2.0,
                            labelText: "Due Date",
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                  color: appTheme().primaryColor, width: 1.0),
                            ),
                            formField: TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10.0),
                                  border: InputBorder.none),
                              controller: _dateController,
                              focusNode: AlwaysDisabledFocusNode(),
                              keyboardType: TextInputType.datetime,
                              onTap: () => _selectDate(context),
                            ),
                          ),
                        ),
//                  IconButton(icon: Icon(Icons.calendar_today, color: Colors.black, size: 10.0,), onPressed: () => _selectDate(context))
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'School Class',
                              style: TextStyle(),
                            ),
                            Container(
                              color: appTheme().backgroundColor,
                              padding: EdgeInsets.all(20.0),
                              child: DropdownButton(
//                            isExpanded: true,
                                  value: _value,
                                  items: buildDropDownItems(classes : widget?.school?.teacherClasses),
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                      classId = hasClass ? widget.school.teacherClasses[_value-1].id : null;
                                    });
                                  }),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Class Subject',
                              style: TextStyle(),
                            ),
                            Container(
                              color: appTheme().backgroundColor,
                              padding: EdgeInsets.all(20.0),
                              child: DropdownButton(
                                  value: _value,
                                  items: buildDropDownSubjectItems(subjects : widget.school.subjects),
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                      subjectId = hasClass ? widget.school.subjects[_value-1].id : null;
                                    });
                                  }),
                            ),
                          ],
                        )
                      ],
                    ),
                    CustomField(
                      width: MediaQuery.of(context).size.width - 60,
                      labelText: "Description",
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                            color: appTheme().primaryColor, width: 1.0),
                      ),
                      formField: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.0),
                            border: InputBorder.none),
                        controller: _descriptionController,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Align(
                      alignment: Alignment.center,
                      child: AttachButton(buttonText: "Attach File", onButtonPressed: openFileExplorer,),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      height: 70.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _filename != null ? Container(
                            height: 30.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(_filename),
                              ),
                            ),
                          )
                              : SizedBox(),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: LoginButton(buttonText: "Create Assignment", onButtonPressed: saveAssignment,),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is AddAssignmentLoadingState){
//                context.showLoaderOverlay();
            return Center(child: Text("Loading...", style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,));
//                  return CircularProgressIndicator();
          }

          if (state is AssignmentSavedState) {
            Future.delayed(Duration(milliseconds: 5), () => Navigator.pushNamedAndRemoveUntil(
              context, AssignmentPage.routeName, ModalRoute.withName("/menu"),
              arguments: widget.arguments,
            ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

