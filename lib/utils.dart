String getHoursAndMinutes(Duration duration) {
  int overallMinutes = duration.inMinutes;
  int hours = (overallMinutes / 60).floor();
  int minutes = overallMinutes - 60 * hours;
  return "${hours}h ${minutes}min";
}
