import 'package:dsapp/models/models.dart';
import 'package:dsapp/models/school/school-category.dart';
import 'package:dsapp/models/school/school-type.dart';
import 'package:equatable/equatable.dart';

class SchoolModel extends Equatable{
  final int id;
  final String name;
  final int dateOfEstablishment;
  final String address1;
  final String address2;
  final double gpsAddressLongitude;
  final double gpsAddressLatitude;
  final String email;
  final String notificationEmail;
  final String phone;
  final String fax;
  final String sigle;
  final SchoolType schoolType;
  final SchoolCategory schoolCategory;
  final String logo;
  final String website;

  final UserRole userRole;
  final SchoolSubscription subscription;

  const SchoolModel({
    this.id,
    this.name,
    this.email, this.phone, this.schoolType , this.schoolCategory,
    this.logo, this.website, this.sigle, this.fax, this.notificationEmail,
    this.gpsAddressLongitude, this.gpsAddressLatitude, this.address2,
    this.address1, this.dateOfEstablishment, this.userRole, this.subscription
});

  static SchoolModel fromJson(Map<String, dynamic> json) {
    return SchoolModel(
        id: json['id'],
        name: json['name'],
        dateOfEstablishment: json['dateOfEstablishment'],
        address1: json['address1'],
        address2: json['address2'],
        gpsAddressLatitude: json['gpsAddressLatitude'],
        gpsAddressLongitude: json['gpsAddressLongitude'],
        email: json['email'],
        notificationEmail: json['notificationEmail'],
        phone: json['phone'],
        fax: json['fax'],
        sigle: json['sigle'],
        website: json['website'],
        schoolCategory: json['schoolCategory'],
        schoolType: json['schoolType'],
        logo: json['logo'],
        userRole: UserRole.fromJson(json['userRole']),
//        subscription: SchoolSubscription.fromJson(json['subscription'])
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}