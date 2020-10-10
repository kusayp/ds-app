class SubjectModel {
  final int id;
  final String name;
  final String description;
  final int credit;

  SubjectModel({this.id, this.name, this.description, this.credit});

  static SubjectModel fromJson(Map<String, dynamic> json){
    return SubjectModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      credit: json['credit'],
    );
  }

  static Map<String, dynamic> toJson(SubjectModel subjectModel) => {
    'id': subjectModel.id,
    'name': subjectModel.name,
    'description': subjectModel.description,
    'credit': subjectModel.credit,
  };
}