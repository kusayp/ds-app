import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClassRegisterCard extends StatefulWidget {
  final UserModel user;
  final int classSchedule;

  const ClassRegisterCard({Key key, this.user, this.classSchedule}) : super(key: key);

  @override
  _ClassRegisterCardState createState() => _ClassRegisterCardState();
}

class _ClassRegisterCardState extends State<ClassRegisterCard> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {

    Widget _userText(){
      if(widget.user.role == 8){
        return Text("Teacher", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black26),);
      }
      else if (widget.user.classPrefect){
        return Text("Class Prefect", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black26),);
      }else{
        return Text("");
      }
    }
    return BlocListener<ClassRegisterBloc, ClassRegisterState>(
      listener: (context, state) {
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        elevation: 4,
        shape: Border(
            left: BorderSide(
              color: Colors.amber,
              width: 2,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/menu/Profile.svg",
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 18,),
                  Column(
                    children: [
                      Text(widget.user.firstName + " " + widget.user.lastName, style: TextStyle(fontSize: 16, letterSpacing: 1.0, fontWeight: FontWeight.w700,),),
                      _userText(),
                    ],
                  ),
                  _loading ? Align(
                    alignment: Alignment.topRight,
                    child: CircularProgressIndicator(),
                  ) : SizedBox(),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Switch(
                  value: widget.user.isPresent,
                  onChanged: (value){
                    print(value);
                    widget.user.isPresent = value;
                    BlocProvider.of<ClassRegisterBloc>(context).add(ToggleClassRegisterEvent(userId: widget.user.id, isPresent: value));
                  },
                  activeColor: Colors.green,
                  focusColor: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmClassRegisterSaveDialog extends StatelessWidget {
  final VoidCallback onPressed;

  const ConfirmClassRegisterSaveDialog({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Do you want to continue?"),
              SizedBox(
                width: 320.0,
                child: RaisedButton(
                  onPressed: () => onPressed,
                  child: Center(
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.white,),
                    ),
                  ),
                  color: appTheme().primaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
