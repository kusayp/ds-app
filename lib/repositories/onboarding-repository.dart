import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';
import 'package:flutter/foundation.dart';

class OnBoardingRepository {
  final OnBoardingService onBoardingService;

  OnBoardingRepository({@required this.onBoardingService})
      : assert(onBoardingService != null);

  Future<OnBoardingModelList> getOnBoardingData(locale) async {
    return await onBoardingService.loadOnBoardingModel(locale);
  }
}
