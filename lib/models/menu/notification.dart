class NotificationModel {
  final int id;
  final String message;
  final bool read;

  NotificationModel({this.id, this.message, this.read});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
//    var list = json['events'] as List;
//    List<Event> events = list.map((e) => Event.fromJson(e)).toList() ?? null;

    return NotificationModel(
      id: json['id'],
      message: json['message'],
      read: json["read"],
    );
  }
}