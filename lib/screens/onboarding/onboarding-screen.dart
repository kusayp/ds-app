import 'package:dsapp/models/models.dart';
import 'package:dsapp/screens/screens.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:dsapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  final OnBoardingModelList pages;
  final Color bgColor;
  final Color themeColor;
  final ValueChanged<String> skipClicked;
  final ValueChanged<String> getStartedClicked;

  OnBoardingScreen({
    Key key,
    @required this.pages,
    @required this.bgColor,
    @required this.themeColor,
    @required this.skipClicked,
    @required this.getStartedClicked,
  }) : super(key: key);

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  LocalStorage sharedPreferences = LocalStorage();

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < widget.pages.onBoardingList.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  List<Widget> buildOnBoardingPages() {
    final children = <Widget>[];

    for (int i = 0; i < widget.pages.onBoardingList.length; i++) {
      children.add(_showPageData(widget.pages.onBoardingList[i]));
    }
    return children;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 4.0,
      width: isActive ? 30.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? widget.themeColor : appTheme().accentColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: widget.bgColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                        sharedPreferences.setOnBoardingViewed(onBoardingViewed: true);
                      },
                      child: Text(
                        'Skip',
                        style: ThemeText.onBoardingSkip
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    height:  MediaQuery.of(context).size.height * 0.75,
                    color: Colors.transparent,
                    child: PageView(
                        physics: ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: buildOnBoardingPages()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  SizedBox(height:  MediaQuery.of(context).size.height * 0.01,),
                  _currentPage != widget.pages.onBoardingList.length - 1
                      ? LoginButton(onButtonPressed: pageController, buttonText: "Next",)
                      : LoginButton(onButtonPressed: _getStartedTapped, buttonText: "Get Started",),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _showPageData(OnBoardingModel page) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: SvgPicture.asset(
              page.imagePath,
              width: 150.0,
              height: 150.0,
            ),
          ),
          SizedBox(height: 40.0),
          Center(
            child: Text(
              page.title,
              style: ThemeText.onBoardingHeader,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 40.0),
          Align(
            alignment: Alignment.center,
            child: Text(
              page.description,
              style: ThemeText.onBoardingDescription,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void _getStartedTapped() async {
      Navigator.pushNamed(context, '/login');
      sharedPreferences.setOnBoardingViewed(onBoardingViewed: true);
  }

  void pageController(){
    _pageController.nextPage(
        duration: Duration(milliseconds: 500),
    curve: Curves.ease
    );
  }
}
