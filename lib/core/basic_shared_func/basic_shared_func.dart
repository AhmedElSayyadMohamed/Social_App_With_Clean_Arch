import 'package:intl/intl.dart';

String dateFormatting(String date){
  DateTime originalDateTime = DateTime.parse(date);
  String formattedDateTime = DateFormat('MMMM d, y - hh:mm a').format(originalDateTime);
  return formattedDateTime;
}
String dateFormattingAndDifferenceFromNow(String date){
  DateTime originalDateTime = DateTime.parse(date);
  // Get the current date and time
  DateTime now = DateTime.now();
  // Calculate the difference
  Duration difference = now.difference(originalDateTime);
  return formatDuration(difference);
}

String formatDuration(Duration duration) {
  if (duration.inDays > 0) {
    return '${duration.inDays} day';
  } else if (duration.inHours > 0) {
    return '${duration.inHours} hour';
  } else if (duration.inMinutes > 0) {
    return '${duration.inMinutes} minute';
  } else {
    return '${duration.inSeconds} second';
  }
}