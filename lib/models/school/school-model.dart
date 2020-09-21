import 'package:dsapp/models/school/school-category.dart';
import 'package:dsapp/models/school/school-type.dart';

class SchoolModel{
  int id;
  String name;
  int dateOfEstablishment;
  String address1;
  String address2;
  double gpsAddressLongitude;
  double gpsAddressLatitude;
  String email;
  String notificationEmail;
  String phone;
  String fax;
  String sigle;
  SchoolType schoolType;
  SchoolCategory schoolCategory;
  String logo;
  String website;

//  UserRole userRole;
//  SchoolSubscription subscription;

  SchoolModel.fromJson(Map json)
      :
        id = json['id'],
        name = json['name'],
        dateOfEstablishment = json['dateOfEstablishment'],
        address1 = json['address1'],
        address2 = json['address2'],
        gpsAddressLatitude = json['gpsAddressLatitude'],
        gpsAddressLongitude = json['gpsAddressLongitude'],
        email = json['email'],
        notificationEmail = json['notificationEmail'],
        phone = json['phone'],
        fax = json['fax'],
        sigle = json['sigle'],
        website = json['website'],
        schoolCategory = json['schoolCategory'],
        schoolType = json['schoolType'],
        logo = json['logo'];
}