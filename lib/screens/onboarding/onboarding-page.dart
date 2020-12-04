import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
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
    return Scaffold(
      body: BlocProvider(
        create: (context) => OnBoardingBloc(onBoardingRepository: onBoardingRepository),
        child: OnBoardingPage(),
      ),
    );
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
    String user = await prefs.getSharedPreference("user");
    if (user != null) {
      LoginResponse loginResponse = LoginResponse.fromJson(user);
      Navigator.pushNamedAndRemoveUntil(
          context, '/menu', ModalRoute.withName('/menu'), arguments: loginResponse);
    }
    else if (onBoardingViewed) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/users', ModalRoute.withName('/users'));
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
}