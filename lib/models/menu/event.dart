class Event {
  final String name;

  Event({this.name});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      name: json['name']
    );
  }
}