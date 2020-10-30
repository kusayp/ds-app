import 'package:dsapp/models/models.dart';
import 'package:dsapp/models/school/school-model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserModel extends Equatable{
  final int id;
  final String firstName;
  final String middleName;
  final String lastName;
  String fullName;
  final String phone;
  final String email;
  final String password;
  final bool defaultPassword;
  final int dateOfBirth;
  final String whatsAppPhone;
  final String pseudo;
  final int gender;
  String token;
  int role;
  final List<int> roles;
  final String registrationNumber;
  final bool active;
  final SchoolModel school;
  final String genderText;
  final SchoolClassModel studentClass;
  final String dob;
  final String picture;
  final bool classPrefect;
  bool isPresent = false;

   UserModel({
    this.id,
    this.password,
    this.token,
    this.phone,
    this.email,
    this.picture,
    this.school,
    this.registrationNumber,
    this.gender,
    this.pseudo,
    this.dateOfBirth,
    this.middleName,
    this.lastName,
    this.firstName,
    this.active,
    this.studentClass,
    this.defaultPassword,
    this.dob,
    this.fullName,
    this.genderText,
    this.role,
    this.roles,
    this.whatsAppPhone,
    this.classPrefect
  });
  @override
  // TODO: implement props
  List<Object> get props => [id, firstName, lastName, middleName, fullName, phone, email, password, defaultPassword, dateOfBirth, whatsAppPhone, pseudo, gender,
  token, role, roles, registrationNumber, active, school, genderText, studentClass, dob, picture,classPrefect, isPresent];

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
        id : json['id'],
        firstName : json['firstName'],
        lastName : json['lastName'],
        middleName : json['middleName'],
        phone : json['phone'],
        email : json['email'],
        dateOfBirth : json['dateOfBirth'],
        pseudo : json['pseudo'],
        gender : json['gender'],
        role: json.containsKey('role') ? json['role']['id'] as int : null,
        registrationNumber : json['registrationNumber'],
      studentClass: json["studentClass"] != null ? SchoolClassModel.fromJson(json['studentClass']) : null,
        picture : json['picture'],
      classPrefect: json['classPrefect'],
    );
  }

  static Map<String, dynamic> toJson(UserModel userModel) => {
    'id' : userModel.id,
    'firstName' : userModel.firstName,
    'lastName' : userModel.lastName,
    'middleName' : userModel.middleName,
    'phone' : userModel.phone,
    'email' : userModel.email,
    'dateOfBirth' : userModel.dateOfBirth,
    'pseudo' : userModel.pseudo,
    'gender' : userModel.gender,
    'registrationNumber' : userModel.registrationNumber,
    'studentClass': SchoolClassModel.toJson(userModel.studentClass),
    'picture' : userModel.picture,
    'classPrefect': userModel.classPrefect,
  };

  set setRole(int role){
    this.role = role;
  }

  set setToken(String token){
    this.token = token;
  }

  String get getFullName{
    return this.fullName = firstName + " " + lastName;
  }

}