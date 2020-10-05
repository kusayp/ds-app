class Seniority{
  final int id;
  final String name;

  Seniority({this.id, this.name});

 static Seniority fromJson(Map<String, dynamic> json){
  return Seniority(
      id: json['id'],
      name: json['name']
  );
 }
}