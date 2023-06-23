import 'package:intl/intl.dart';

String convertDateFormat(String ymdDate) {
  DateTime date = DateTime.parse(ymdDate);
  String dmyDate = DateFormat('dd-MM-yyyy').format(date);
  return dmyDate;
}