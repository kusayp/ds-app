import 'package:dsapp/models/school/school-model.dart';
import 'package:dsapp/models/users/grade.dart';
import 'package:dsapp/models/users/seniority.dart';

class UserModel{
  int id;
  String firstName;
  String middleName;
  String lastName;
  String fullName;
  String phone;
  String email;
  String password;
  bool defaultPassword;
  int dateOfBirth;
  String whatsAppPhone;
  String pseudo;
  int gender;
  String token;
  int role;
  List<int> roles;
  String registrationNumber;
  bool active;
  SchoolModel school;
  Grade grade;
  Seniority seniority;
  String genderText;
  String activeText;
//  List<Subject> subjects;
//  List<Activity> extraActivities;
  String dob;
//  String[] headers;
  String picture;

  UserModel.fromJson(Map json)
      :
        id = json['id'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        middleName = json['middleName'],
        phone = json['phone'],
        email = json['email'],
        dateOfBirth = json['dateOfBirth'],
        pseudo = json['pseudo'],
        gender = json['gender'],
        registrationNumber = json['registrationNumber'],
        school = json['school'],
        picture = json['picture'],
        grade = json['grade'],
        seniority = json['seniority'];

}