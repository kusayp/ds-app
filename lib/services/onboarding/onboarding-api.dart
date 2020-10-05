import 'dart:async';
import 'dart:convert';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/utils/shared-preference.dart';
import 'package:flutter/services.dart' show rootBundle;
//import 'package:http/http.dart' as http;

class OnBoardingService {

  Future<String> _loadOnBoardingModel() async {
    return await rootBundle.loadString('assets/menus/onboarding.json');
  }

  Future<OnBoardingModelList> loadOnBoardingModel() async {
    String jsonString = await _loadOnBoardingModel();
    final jsonResponse = json.decode(jsonString);
    OnBoardingModelList onBoardingModelList = OnBoardingModelList.fromJson(jsonResponse);
//  final onboardingList = jsonResponse
//      .map<OnBoardingModel>((json) => OnBoardingModel.fromJson(json['onboarding']))
//      .toList(growable: false);
    print(onBoardingModelList.onBoardingList[0].title);
    return onBoardingModelList;
  }
}