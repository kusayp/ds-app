import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/screens/class_register/class-register-screen.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ClassRegisterPager extends StatelessWidget {
  final MenuArguments arguments;

  const ClassRegisterPager({Key key, this.arguments}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () => Navigator.of(context).pop(),
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed:  () {
        BlocProvider.of<ClassRegisterBloc>(context).add(SaveClassRegisterEvent());
        Navigator.of(context).pop();
      },
    );

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Class Register",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          FlatButton(onPressed: (){
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("Save Class Register"),
                  content: Text("Do you want to continue?"),
                  actions: [
                    cancelButton,
                    continueButton,
                  ],
                ),
                barrierDismissible: false
            );
          }, child: Text('SAVE', style: TextStyle(backgroundColor: Hexcolor('#F65A75'), color: Colors.white, fontWeight: FontWeight.bold),), ),
        ],
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: appTheme().backgroundColor,
      body: ClassRegisterScreen(user: arguments.roleModules,),
    );
  }
}

class ClassRegisterPage extends StatelessWidget {
  static const routeName = '/class register';
  @override
  Widget build(BuildContext context) {
    final ClassRegisterRepository repository = ClassRegisterRepository(classRegisterService: ClassRegisterService());
    final MenuArguments arguments = ModalRoute.of(context).settings.arguments;
    return BlocProvider<ClassRegisterBloc>(
        create: (context) => ClassRegisterBloc(repository: repository),
        child: ClassRegisterPager(arguments: arguments,),
    );
  }
}

