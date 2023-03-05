String getHoursAndMinutes(Duration duration, {bool short = false}) {
  int overallMinutes = duration.inMinutes;
  int hours = (overallMinutes / 60).floor();
  int minutes = overallMinutes - 60 * hours;
  return short ? "$hours:$minutes" : "${hours}h ${minutes}min";
}
