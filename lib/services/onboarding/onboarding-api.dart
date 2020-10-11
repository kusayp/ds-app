import 'dart:async';
import 'dart:convert';
import 'package:dsapp/models/models.dart';
import 'package:flutter/services.dart' show rootBundle;

class OnBoardingService {

  Future<String> _loadOnBoardingModel() async {
    return await rootBundle.loadString('assets/menus/onboarding.json');
  }

  Future<OnBoardingModelList> loadOnBoardingModel() async {
    String jsonString = await _loadOnBoardingModel();
    final jsonResponse = json.decode(jsonString);
    OnBoardingModelList onBoardingModelList = OnBoardingModelList.fromJson(jsonResponse);
    return onBoardingModelList;
  }
}