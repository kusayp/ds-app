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
  final List<UserModel> children;
  final List<SubjectModel> subjects;
  final String email;
  final String notificationEmail;
  final String phone;
  final SchoolClassModel studentClass;
  final String sigle;
  final SchoolType schoolType;
  final SchoolCategory schoolCategory;
  final String logo;
  final List<SchoolClassModel> teacherClasses;

  final UserRole role;
  final SchoolSubscription subscription;

  const SchoolModel({
    this.id,
    this.name,
    this.email, this.phone, this.schoolType , this.schoolCategory,
    this.logo, this.subjects, this.sigle, this.studentClass, this.notificationEmail,
    this.children, this.teacherClasses, this.address2,
    this.address1, this.dateOfEstablishment, this.role, this.subscription
});

  static SchoolModel fromJson(Map<String, dynamic> json) {
    var list = json['subjects'] as List;
    List<SubjectModel> subjects = json['subjects'] != null ? list.map((e) => SubjectModel.fromJson(e)).toList() : [];
    var childrenList = json['children'] as List;
    List<UserModel> children = json['children'] != null ? childrenList.map((e) => UserModel.fromJson(e)).toList() : [];
    var teacherClassesList = json['children'] as List;
    List<SchoolClassModel> teacherClasses = json['teacherClasses'] != null ? teacherClassesList.map((e) => SchoolClassModel.fromJson(e)).toList() : [];
    return SchoolModel(
        id: json['id'],
        name: json['name'],
      subjects: subjects,
      children: children,
      studentClass: json["studentClass"] != null ? SchoolClassModel.fromJson(json['studentClass']) : null,
      teacherClasses: teacherClasses,
        logo: json['logo'],
        role: UserRole.fromJson(json['role']),
//        subscription: SchoolSubscription.fromJson(json['subscription'])
    );
  }

  static Map<String, dynamic> toJson(SchoolModel schoolModel) => {
    'id': schoolModel.id,
    'name': schoolModel.name,
    'subjects': schoolModel.subjects.isNotEmpty ? schoolModel.subjects.map((e) => SubjectModel.toJson(e)).toList() : null,
//    'children': schoolModel.children.isNotEmpty ? schoolModel.children.map<Map<String, dynamic>>((e) => UserModel.toJson(e)).toList() : null,
    'children': schoolModel.children.isNotEmpty ? schoolModel.children.map((e) => UserModel.toJson(e)).toList() : null,
    'studentClass': SchoolClassModel.toJson(schoolModel.studentClass),
    'teacherClasses': schoolModel.teacherClasses.isNotEmpty ? schoolModel.teacherClasses.map((e) => SchoolClassModel.toJson(e)).toList() : null,
    'logo': schoolModel.name,
    'role': schoolModel.name,
  };

//  static String encodeChildren(List<UserModel> users)

  @override
  // TODO: implement props
  List<Object> get props => [];
}