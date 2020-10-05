class UserRole {
  final int id;
  final String name;

  UserRole({this.name, this.id});

  static UserRole fromJson(Map<String, dynamic> json){
    return UserRole(
      id: json['id'],
      name: json['name']
    );
  }
}