class Day {
  final int id;
  final String day;
  final String daySlug;
  final int color;

  Day({this.id, this.day, this.daySlug, this.color});
}

final days = [
  Day(id: 0, daySlug: "Mon", day: "Monday", color: 0xff000000),
  Day(id: 1, daySlug: "Tue", day: "Tuesday", color: 0xff000000),
  Day(id: 2, daySlug: "Wed", day: "Wednesday", color: 0xff000000),
  Day(id: 3, daySlug: "Thu", day: "Thursday", color: 0xff000000),
  Day(id: 4, daySlug: "Fri", day: "Friday", color: 0xff000000),
  Day(id: 5, daySlug: "Sat", day: "Saturday", color: 0xffF96982),
  Day(id: 6, daySlug: "Sun", day: "Sunday", color: 0xffF96982)
];
