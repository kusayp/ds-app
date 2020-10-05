class SchoolSubscription {
  final int id;
  final bool trial;
  final int startDate;
  final int endDate;

  SchoolSubscription({this.id, this.trial, this.startDate, this.endDate});

  static SchoolSubscription fromJson(Map<String, dynamic> json){
    return SchoolSubscription(
      id: json['id'],
      trial: json['trial'],
      startDate: json['startDate'],
      endDate: json['endDate']
    );
  }
}