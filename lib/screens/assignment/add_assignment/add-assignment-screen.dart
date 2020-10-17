import 'dart:io';

import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/common.dart';
import 'package:dsapp/utils/style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddAssignmentScreen extends StatefulWidget {
  final SchoolModel school;

  const AddAssignmentScreen({Key key, this.school}) : super(key: key);
  @override
  _AddAssignmentScreenState createState() => _AddAssignmentScreenState();
}

class _AddAssignmentScreenState extends State<AddAssignmentScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate;
  String _filename;

  int _value = 1;
  @override
  Widget build(BuildContext context) {
//    _dateController.text = Common.formatDate(selectedDate.millisecondsSinceEpoch);
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
    void showPaymentDialog(){
      showDialog(
          context: context,
          builder: (_) => PaymentAlertDialog(),
          barrierDismissible: false
      );
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

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 20, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        keyboardType: TextInputType.text,
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
                            items: buildDropDownItems(classes : widget.school.teacherClasses),
                            onChanged: (value) {
                              setState(() {
                                _value = value;
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
                  keyboardType: TextInputType.text,
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
                child: LoginButton(buttonText: "Create Assignment", onButtonPressed: showPaymentDialog,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

