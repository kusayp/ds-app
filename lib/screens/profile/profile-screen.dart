import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/login/components/login-field-component.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sprintf/sprintf.dart';

class ProfileScreen extends StatelessWidget {
  final RoleModules userDetails;

  ProfileScreen({this.userDetails});

  @override
  Widget build(BuildContext context) {
    bool isTeacher = userDetails.role == "ENSEINGNANT";
    bool isStudent = userDetails.role == "APPRENANT";
    bool isParent = userDetails.role == "PARENT";

    List<Widget> buildStudentSubjects(List<SubjectModel> subjects){
      final children = <Widget>[];
      for (int i = 0; i < subjects.length; i++) {
        children.add(Text(subjects[i].name));
      }
      return children;
    }

    List<Widget> buildTeacherClasses(List<SchoolClassModel> classes){
      final children = <Widget>[];
      for (int i = 0; i < classes.length; i++) {
        children.add(Text(classes[i].name));
      }
      return children;
    }

    List<Widget> buildParentChildren(List<UserModel> wards){
      final children = <Widget>[];
      for (int i = 0; i < children.length; i++) {
        children.add(Text(sprintf('%s %s', [wards[i].firstName, wards[i].lastName])));
      }
      return children;
    }

    onUpdatePressed(){
      return showDialog(
          context: context,
          builder: (_) => isStudent ? UpdatePasswordDialog(text: "Please enter your registration number",) : UpdatePasswordDialog(text: "Please comfirm your email or phone number",),
          barrierDismissible: false
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/payment/download.jpeg'),
                  radius: 70.0,
                ),
              ),
            ),
//          SizedBox(height: 5.0,),
            Text(sprintf('%s %s', [userDetails.user.firstName.toUpperCase(), userDetails.user.lastName.toUpperCase()]), style: TextStyle(fontSize: 24,), textAlign: TextAlign.center,),
            isStudent ? Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: Text(userDetails.school.studentClass.name, style: TextStyle(fontSize: 14), textAlign: TextAlign.center,),
            ) : SizedBox(),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                padding: EdgeInsets.all(10.0),
                height: MediaQuery.of(context).size.height / 5,
                color: Colors.black12,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Email:"),
                        Text(userDetails.user.email),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Phone:"),
                          Text(userDetails.user.phone),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Address:"),
                        Text("12th street, holme"),
                      ],
                    ),
                    isTeacher ? Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Classes:"),
                          Column(
                            children: buildTeacherClasses(userDetails.school.teacherClasses),
                          ),
                        ],
                      ),
                    ) : SizedBox(),
                    isStudent ? Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subjects:"),
                          Column(
                            children: buildStudentSubjects(userDetails.school.subjects),
                          ),
                        ],
                      ),
                    ) : SizedBox(),
                    isParent ? Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Children:"),
                          Column(
                            children: buildParentChildren(userDetails.school.children),
                          ),
                        ],
                      ),
                    ) : SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Contact School:"),
                        Column(
                          children: [
                            Text(userDetails.school.address1 ?? "", textAlign: TextAlign.center,),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 00.0),
              child: LoginButton(buttonText: "Update Password", onButtonPressed: onUpdatePressed,),
            )
          ],
        ),
      ),
    );
  }
}
