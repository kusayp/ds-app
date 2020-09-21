class Seniority{
  int id;
  String name;

  Seniority.fromJson(Map json)
      : id = json['id'],
        name = json['name'];
}