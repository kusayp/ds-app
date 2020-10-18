import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/models/onboarding/onboarding-model.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/screens/onboarding/onboarding-screen.dart';
import 'package:dsapp/services/services.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingPageScreen extends StatelessWidget {
  final OnBoardingRepository onBoardingRepository = OnBoardingRepository(onBoardingService: OnBoardingService());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    checkUserLogin(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) => OnBoardingBloc(onBoardingRepository: onBoardingRepository),
        child: OnBoardingPage(),
      ),
    );
  }

  Future<bool> checkUserLogin(BuildContext context) async {
    LocalStorage prefs = LocalStorage();
    bool onBoardingViewed = await prefs.isOnBoardingViewed();
    String user = await prefs.getUserDetails();
    if (user != null){
      LoginResponse loginResponse = LoginResponse.fromJson(user);
      var role = loginResponse.schools.single.role.name;
      RoleModules roleModules = await MenuService().loadUserRoleModules(role);
      List<Module> modules = roleModules.modules;
      Navigator.pushReplacementNamed(context, '/menu', arguments: modules);
      return true;
    } else if(onBoardingViewed){
      Navigator.pushReplacementNamed(context, '/login');
      return true;
    }
    return false;
  }

}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    LocalStorage prefs = LocalStorage();
    bool onBoardingViewed = await prefs.isOnBoardingViewed();
    String user = await prefs.getUserDetails();
    if (user != null) {
      LoginResponse loginResponse = LoginResponse.fromJson(user);
      Navigator.pushNamedAndRemoveUntil(
          context, '/menu', ModalRoute.withName('/menu'), arguments: loginResponse);
    }
    else if (onBoardingViewed) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login', ModalRoute.withName('/login'));
    } else {
      build(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      builder: (context, state) {

        if (state is OnBoardingLoaded) {
          return Scaffold(
            backgroundColor: appTheme().backgroundColor,
            key: _globalKey,
            body: OnBoardingScreen(
              bgColor: Colors.white,
              themeColor: appTheme().primaryColor,
              pages: state.onBoardingModelList,
              skipClicked: (value) {
                print(value);
                _globalKey.currentState.showSnackBar(SnackBar(
                  content: Text("Skip clicked"),
                ));
              },
              getStartedClicked: (value) {
                print(value);
//          Navigator.pushNamed(context, '/users');
                _globalKey.currentState.showSnackBar(SnackBar(
                  content: Text("Get Started clicked"),
                ));
              },
            ),
          );
        }

        if(state is OnBoardingEmpty){
          BlocProvider.of<OnBoardingBloc>(context).add(FetchOnBoarding());
        }
        if(state is OnBoardingViewedState || state is OnBoardingUserLoggedIn){

        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  final pages = [
    OnBoardingModel(
        title: 'Choose your item',
        description:
        'Easily find your grocery items and you will get delivery in wide range Easily find your grocery items and you will get delivery in wide range',
        titleColor: Colors.black,
        descriptionColor: const Color(0xFF929794),
        imagePath: 'assets/images/menu/Timetable.svg'
    ),
    OnBoardingModel(
        title: 'Pick Up or Delivery',
        description:
        'We make ordering fast, simple and free-no matter if you order online or cash',
        titleColor: Colors.black,
        descriptionColor: const Color(0xFF929794),
        imagePath: 'assets/images/menu/Timetable.svg'
    ),
    OnBoardingModel(
        title: 'Pay quick and easy',
        description: 'Pay for order using credit or debit card',
        titleColor: Colors.black,
        descriptionColor: const Color(0xFF929794),
        imagePath: 'assets/images/menu/Timetable.svg'
    ),
  ];
}