import 'package:dsapp/generated/l10n.dart';

class Day {
  final int id;
  final String day;
  final String daySlug;
  final int color;

  Day({this.id, this.day, this.daySlug, this.color});
}

final days = [
  Day(id: 0, daySlug: S.current.mon, day: "Monday", color: 0xff000000),
  Day(id: 1, daySlug: S.current.tue, day: "Tuesday", color: 0xff000000),
  Day(id: 2, daySlug: S.current.wed, day: "Wednesday", color: 0xff000000),
  Day(id: 3, daySlug: S.current.thu, day: "Thursday", color: 0xff000000),
  Day(id: 4, daySlug: S.current.fri, day: "Friday", color: 0xff000000),
  Day(id: 5, daySlug: S.current.sat, day: "Saturday", color: 0xffF96982),
  Day(id: 6, daySlug: S.current.sun, day: "Sunday", color: 0xffF96982)
];
