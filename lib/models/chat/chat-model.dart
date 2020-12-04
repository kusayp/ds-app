import 'package:equatable/equatable.dart';

enum Direction {
  IN,
  OUT
}

class ChatModel extends Equatable{
  final int id;
  final int toOrFrom;
  final int direction;
  final String title;
  final String message;
  final int timeStamp;

  ChatModel({this.id, this.toOrFrom, this.direction, this.title, this.message, this.timeStamp});

  static ChatModel fromJson(Map<String, dynamic> json){
    return ChatModel(
      id: json['id'],
      toOrFrom: json['toOrFrom'],
      direction: json['direction'],
      title: json['title'],
      message: json['message'],
      timeStamp: json['timeStamp'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'toOrFrom': toOrFrom,
    'direction': direction,
    'title': title,
    'message': message,
    'timeStamp': timeStamp,
  };

  @override
  List<Object> get props => [];


}