String getHoursAndMinutes(Duration duration, {bool short = false}) {
  int overallMinutes = duration.inMinutes;
  int hours = (overallMinutes / 60).floor();
  int minutes = overallMinutes - 60 * hours;
  String minuteString = minutes.toString().padLeft(2, "0");
  return short ? "$hours:$minuteString" : "${hours}h ${minuteString}min";
}
