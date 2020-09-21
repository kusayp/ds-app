import 'package:flutter/material.dart';

class OnBoardingModel {
  String title;
  String description;
  Color titleColor;
  Color descriptionColor;
  String imagePath;

  OnBoardingModel({
    this.title,
    this.description,
    this.imagePath,
    this.titleColor,
    this.descriptionColor,
  });

  factory OnBoardingModel.fromJson(Map<String, dynamic> parsedJson) {
    return OnBoardingModel(
        title: parsedJson['title'],
        description: parsedJson['description'],
        imagePath: parsedJson['icon']);
  }

}