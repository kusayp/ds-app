class ClassRoomModel {
  final int id;
  final String description;
  final bool available;

  ClassRoomModel({this.id, this.description, this.available});

  static ClassRoomModel fromJson(Map<String, dynamic> json){
    return ClassRoomModel(
        id: json['id'],
        description: json['description'],
        available: json['available']
    );
  }
}
