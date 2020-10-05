import 'package:dsapp/models/menu/menu.dart';

class Module {
  final int id;
  final String menu;
  final String icon;
  final String description;
  final List<Event> events;

  Module({this.id, this.description, this.menu, this.icon, this.events});

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