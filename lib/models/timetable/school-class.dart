class SchoolClassModel {
  final int id;
  final String name;

  SchoolClassModel({this.id, this.name});

  static SchoolClassModel fromJson(Map<String, dynamic> json){
    return SchoolClassModel(
      id: json['id'],
      name: json['name']
    );
  }

  static Map<String, dynamic> toJson(SchoolClassModel schoolClassModel) => {
    'id': schoolClassModel.id,
    'name': schoolClassModel.name,
  };
}