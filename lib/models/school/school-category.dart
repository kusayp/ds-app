class SchoolCategory{
  int id;
  String name;

  SchoolCategory.fromJson(Map json)
      : id = json['id'],
        name = json['name'];
}