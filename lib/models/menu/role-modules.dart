import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/models/models.dart';

class RoleModules{
  final String role;
  final UserModel user;
  final List<Module> modules;
  final SchoolModel school;

  RoleModules({this.role, this.modules, this.user, this.school});

  static RoleModules fromJson(Map<String, dynamic> json){
    var list = json['modules'] as List;
    List<Module> modules = list.map((e) => Module.fromJson(e)).toList() ?? null;
    return RoleModules(
      role: json['role'],
      modules: modules
    );
  }
}