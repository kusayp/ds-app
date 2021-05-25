import 'dart:async';
import 'dart:convert';

import 'package:dsapp/models/models.dart';
import 'package:flutter/services.dart' show rootBundle;

class OnBoardingService {
  Future<String> _loadOnBoardingModel(locale) async {
    return await rootBundle.loadString('assets/menus/onboarding-$locale.json');
  }

  Future<OnBoardingModelList> loadOnBoardingModel(locale) async {
    String jsonString = await _loadOnBoardingModel(locale);
    final jsonResponse = json.decode(jsonString);
    OnBoardingModelList onBoardingModelList =
        OnBoardingModelList.fromJson(jsonResponse);
    return onBoardingModelList;
  }
}
