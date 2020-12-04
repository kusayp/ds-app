import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/onboarding/onboarding.dart';
import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/services/services.dart';
import 'package:flutter/foundation.dart';

import '../../utils/shared-preference.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final OnBoardingRepository onBoardingRepository;

  OnBoardingBloc({@required this.onBoardingRepository}) : assert(onBoardingRepository !=  null), super(OnBoardingEmpty());

  @override
  void onTransition(Transition<OnBoardingEvent, OnBoardingState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<OnBoardingState> mapEventToState(OnBoardingEvent event) async* {
    if (event is FetchOnBoarding) {
      yield OnBoardingLoading();
      LocalStorage prefs = LocalStorage();
      bool onBoardingViewed = await prefs.isOnBoardingViewed();
      String user = await prefs.getSharedPreference("user");
      try {
        if (user != null){
          LoginResponse loginResponse = LoginResponse.fromJson(user);
          print(loginResponse);
          var role = loginResponse.schools[0].role.name;
          RoleModules roleModules = await MenuService().loadUserRoleModules(role);
          List<Module> modules = roleModules.modules;
          yield OnBoardingUserLoggedIn(modules: modules);
        } else if(onBoardingViewed){
          yield OnBoardingViewedState();
        }
        else{
          final OnBoardingModelList onBoardingModelList = await onBoardingRepository.getOnBoardingData();
          yield OnBoardingLoaded(onBoardingModelList: onBoardingModelList);
        }
      }
      catch (_) {
        yield OnBoardingError();
      }
    }
    if (event is OnBoardingViewedEvent){
      yield OnBoardingViewedState();
    }

    if (event is OnBoardingUserLoggedInEvent){
      LocalStorage prefs = LocalStorage();
      String user = await prefs.getSharedPreference("user");
      LoginResponse loginResponse = LoginResponse.fromJson(user);
      var role = loginResponse.schools.single.role.name;
      RoleModules roleModules = await MenuService().loadUserRoleModules(role);
      List<Module> modules = roleModules.modules;
    yield OnBoardingUserLoggedIn(modules: modules);
    }
  }


}