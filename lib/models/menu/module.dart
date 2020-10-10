import 'package:dsapp/models/menu/menu.dart';
import 'package:dsapp/models/models.dart';

class Module {
  final int id;
  final String menu;
  final String icon;
//  final int studentClassId;
  final UserModel studentUser;
  final String description;
  final List<Event> events;

  Module({this.id, this.description, this.menu, this.icon, this.events, this.studentUser});

  factory Module.fromJson(Map<String, dynamic> json) {
    var list = json['events'] as List;
    List<Event> events = list.map((e) => Event.fromJson(e)).toList() ?? null;

    return Module(
      id: json['id'],
      menu: json['menu'],
      icon: json["icon"],
      description: json["description"],
      events: events
    );
  }
}