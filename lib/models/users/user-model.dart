import 'package:dsapp/models/school/school-model.dart';
import 'package:dsapp/models/users/grade.dart';
import 'package:dsapp/models/users/seniority.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable{
  final int id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String fullName;
  final String phone;
  final String email;
  final String password;
  final bool defaultPassword;
  final int dateOfBirth;
  final String whatsAppPhone;
  final String pseudo;
  final int gender;
  final String token;
  final int role;
  final List<int> roles;
  final String registrationNumber;
  final bool active;
  final SchoolModel school;
//  final Grade grade;
//  final Seniority seniority;
  final String genderText;
  final String activeText;
//  List<Subject> subjects;
//  List<Activity> extraActivities;
  final String dob;
//  String[] headers;
  final String picture;

  const UserModel({
    this.id,
    this.password,
    this.token,
    this.phone,
    this.email,
//    this.seniority,
//    this.grade,
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
    this.activeText,
    this.defaultPassword,
    this.dob,
    this.fullName,
    this.genderText,
    this.role,
    this.roles,
    this.whatsAppPhone
  });

  @override
  // TODO: implement props
  List<Object> get props => [id, firstName, lastName, middleName, fullName, phone, email, password, defaultPassword, dateOfBirth, whatsAppPhone, pseudo, gender,
  token, role, roles, registrationNumber, active, school, genderText, activeText, dob, picture];

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
        registrationNumber : json['registrationNumber'],
        school : json['school'],
        picture : json['picture'],
//        grade : Grade.fromJson(json['grade']),
//        seniority : Seniority.fromJson(json['seniority'])
    );
  }

}