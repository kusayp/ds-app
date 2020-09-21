import 'dart:async';
import 'dart:convert';
import 'package:dsapp/models/onboarding/onboarding-model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

Future<String> exampleApi(String orgid) async {
  http.Response response = await http.get(
    Uri.encodeFull("https://www.example.com/api"),
  );
  print("Respone ${response.body.toString()}");
  //Returns 'true' or 'false' as a String
  return response.body;
}

Future<String> _loadOnBoardingModel() async {
  return await rootBundle.loadString('assets/menus/onboarding.json');
}

Future<List<OnBoardingModel>> loadOnBoardingModel() async {
//  await wait(5);
  String jsonString = await _loadOnBoardingModel();
  final jsonResponse = json.decode(jsonString);
  final onboardingList = jsonResponse
      .map<OnBoardingModel>((json) => OnBoardingModel.fromJson(json['onboarding']))
      .toList(growable: false);
  return onboardingList;
//  return OnBoardingModel.fromJson(jsonResponse);
}