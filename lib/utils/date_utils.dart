import '../constants/constants_value.dart';

String getQuestionDate(String timeStamp){
  DateTime date = DateTime.parse(timeStamp);
  return '${date.year}.${date.month}.${date.day} ${kEnWeekDay[date.weekday-1]}';
}