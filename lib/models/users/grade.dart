class Grade{
  final int id;
  final String name;

  Grade({this.id, this.name});

  static Grade fromJson(Map<String, dynamic> json){
    return Grade(
        id: json['id'],
        name: json['name']
    );
  }
}