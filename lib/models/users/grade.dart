class Grade{
  int id;
  String name;

  Grade.fromJson(Map json)
      : id = json['id'],
        name = json['name'];
}