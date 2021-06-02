import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class ClassRegisterState extends Equatable {
  ClassRegisterState();
  @override
  List<Object> get props => [];
}

class ClassRegisterEmptyState extends ClassRegisterState {}

class ClassRegisterToggledState extends ClassRegisterState {
  final List<UserModel> users;
  final List<TimeTableModel> schedules;
  final TimeTableModel selectedSchedules;
  final String selectedSchoolClass;
  final int timeStamp;

  ClassRegisterToggledState({this.users,
    this.schedules,
    this.selectedSchedules,
    this.timeStamp,
    this.selectedSchoolClass});

  @override
  List<Object> get props =>
      [users, schedules, selectedSchedules, timeStamp, selectedSchoolClass];
}

class ClassRegisterScheduleLoadedState extends ClassRegisterState {
  final TimeTablePageData tablePageData;

  ClassRegisterScheduleLoadedState({this.tablePageData});

  @override
  List<Object> get props => [tablePageData];
}

class ClassRegisterLoadedState extends ClassRegisterState {
  final List<UserModel> users;
  final List<TimeTableModel> schedules;
  final TimeTableModel selectedSchedules;
  final String selectedSchoolClass;
  final int timeStamp;

  ClassRegisterLoadedState({this.users,
    this.schedules,
    this.selectedSchedules,
    this.timeStamp,
    this.selectedSchoolClass});

  @override
  List<Object> get props =>
      [users, schedules, selectedSchedules, timeStamp, selectedSchoolClass];
}

class ClassRegisterLoadingState extends ClassRegisterState {}

class ClassRegisterToggleLoadingState extends ClassRegisterState {}

class ClassRegisterSavedState extends ClassRegisterState {}

class ClassRegisterErrorState extends ClassRegisterState {
  final String error;

  ClassRegisterErrorState(this.error);
}

class RegisterState {
  const RegisterState({
    @required this.brands,
    @required this.brand,
    @required this.models,
    @required this.model,
    @required this.years,
    @required this.year,
  });

  final List<String> brands;
  final String brand;

  final List<String> models;
  final String model;

  final List<String> years;
  final String year;

  bool get isComplete => brand != null && model != null && year != null;

  const RegisterState.initial()
      : this(
    brands: const <String>[],
    brand: null,
    models: const <String>[],
    model: null,
    years: const <String>[],
    year: null,
  );

  const RegisterState.brandsLoadInProgress()
      : this(
    brands: const <String>[],
    brand: null,
    models: const <String>[],
    model: null,
    years: const <String>[],
    year: null,
  );

  const RegisterState.brandsLoadSuccess({@required List<String> brands})
      : this(
    brands: brands,
    brand: null,
    models: const <String>[],
    model: null,
    years: const <String>[],
    year: null,
  );

  const RegisterState.modelsLoadInProgress({
    @required List<String> brands,
    @required String brand,
  }) : this(
    brands: brands,
    brand: brand,
    models: const <String>[],
    model: null,
    years: const <String>[],
    year: null,
  );

  const RegisterState.modelsLoadSuccess({
    @required List<String> brands,
    @required String brand,
    @required List<String> models,
  }) : this(
    brands: brands,
    brand: brand,
    models: models,
    model: null,
    years: const <String>[],
    year: null,
  );

  const RegisterState.yearsLoadInProgress({
    @required List<String> brands,
    @required String brand,
    @required List<String> models,
    @required String model,
  }) : this(
    brands: brands,
    brand: brand,
    models: models,
    model: model,
    years: const <String>[],
    year: null,
  );

  const RegisterState.yearsLoadSuccess({
    @required List<String> brands,
    @required String brand,
    @required List<String> models,
    @required String model,
    @required List<String> years,
  }) : this(
    brands: brands,
    brand: brand,
    models: models,
    model: model,
    years: years,
    year: null,
  );

  RegisterState copyWith({
    List<String> brands,
    String brand,
    List<String> models,
    String model,
    List<String> years,
    String year,
  }) {
    return RegisterState(
      brands: brands ?? this.brands,
      brand: brand ?? this.brand,
      models: models ?? this.models,
      model: model ?? this.model,
      years: years ?? this.years,
      year: year ?? this.year,
    );
  }
}
