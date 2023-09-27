import 'package:intl/intl.dart';

String getTime(dateTime) {
  DateTime lastTime = DateTime.parse(dateTime);
  DateTime currentTime = DateTime.now();
  int differenceMinutes = currentTime.difference(lastTime).inMinutes;
  int differenceHours = currentTime.difference(lastTime).inHours;
  int differenceDays = currentTime.difference(lastTime).inDays;
  if (differenceMinutes < 60) {
    if (differenceMinutes == 0) {
      return 'now';
    }
    return '$differenceMinutes m';
  } else if (differenceHours < 24) {
    return '$differenceHours h';
  } else if (differenceDays < 30) {
    return DateFormat('dd,MM yyyy hh:mm a').format(DateTime.parse(dateTime));
  } else if (differenceDays > 30 && differenceDays <= 365) {
    return DateFormat('dd,MM yyyy hh:mm a')
        .format(DateTime.parse(dateTime)); //'${differenceDays / 30} month';
  } else {
    return DateFormat('dd,MM yyyy hh:mm a')
        .format(DateTime.parse(dateTime)); // '${differenceDays / 365} year';
  }
}
