import 'package:dsapp/models/models.dart';

class OnBoardingModelList {
  List<OnBoardingModel> onBoardingList;

  OnBoardingModelList({this.onBoardingList});

  factory OnBoardingModelList.fromJson(List<dynamic> json){
    List<OnBoardingModel> onBoardingList = new List<OnBoardingModel>();
    onBoardingList = json.map((e) => OnBoardingModel.fromJson(e)).toList();
    return new OnBoardingModelList(onBoardingList: onBoardingList);
  }
}
