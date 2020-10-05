import 'package:intl/intl.dart';

class Common{
  static formatDate(int time){
    if(time == null || time == 0) return '';
    var date = DateTime.fromMillisecondsSinceEpoch(time);
    var formattedDate = DateFormat.yMMMd().format(date);
    return formattedDate;
  }

}