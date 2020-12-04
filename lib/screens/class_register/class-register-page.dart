import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/generated/l10n.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/screens/class_register/class-register-screen.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassRegisterPager extends StatelessWidget {
  final MenuArguments arguments;

  const ClassRegisterPager({Key key, this.arguments}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    Widget cancelButton = FlatButton(
      child: Text(S.of(context).cancel),
      onPressed:  () => Navigator.of(context).pop(),
    );
    Widget continueButton = FlatButton(
      child: Text(S.of(context).continueText),
      onPressed:  () {
        BlocProvider.of<ClassRegisterBloc>(context).add(SaveClassRegisterEvent());
        Navigator.of(context).pop();
      },
    );

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          S.of(context).classRegister,
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
                  title: Text(S.of(context).saveClassRegister),
                  content: Text(S.of(context).doYouWantToContinue),
                  actions: [
                    cancelButton,
                    continueButton,
                  ],
                ),
                barrierDismissible: false
            );
          }, child: Text(S.of(context).save, style: TextStyle(backgroundColor: Color(0xffF65A75), color: Colors.white, fontWeight: FontWeight.bold),), ),
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

