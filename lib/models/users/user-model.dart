import 'package:dsapp/models/models.dart';
import 'package:dsapp/models/school/school-model.dart';
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
  final String genderText;
  final SchoolClassModel studentClass;
  final String dob;
  final String picture;

  const UserModel({
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
    this.whatsAppPhone
  });

  @override
  // TODO: implement props
  List<Object> get props => [id, firstName, lastName, middleName, fullName, phone, email, password, defaultPassword, dateOfBirth, whatsAppPhone, pseudo, gender,
  token, role, roles, registrationNumber, active, school, genderText, studentClass, dob, picture];

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
      studentClass: json["studentClass"] != null ? SchoolClassModel.fromJson(json['studentClass']) : null,
        picture : json['picture'],
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
  };

}