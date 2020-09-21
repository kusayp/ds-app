class SchoolType{
  int id;
  String name;

  SchoolType.fromJson(Map json)
      : id = json['id'],
        name = json['name'];
}