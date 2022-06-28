String getTimeToString(int time) {
  var seconds = 0;
  var minutes = 0;
  var hours = 0;

  seconds = time % 60;
  hours = time ~/3600;
  minutes = (time - (hours * 3600))  ~/ 60;

  return hours.toString().padLeft(2, '0') +
      ":" +
    minutes.toString().padLeft(2, '0') +
      ":" +
      seconds.toString().padLeft(2, '0');
}

String getStringToTime(String time) {
  var seconds = 0;
  var minutes = 0;
  var hours = 0;

  hours = int.parse(time.substring(0, 2)) * 3600;
  minutes = (int.parse(time.substring(3, 5)) - hours * 3600) * 60;
  seconds = int.parse(time.substring(6, 8));

  return (hours + minutes + seconds).toString();
}

String diffTimes(String dateInitial, String dateFinal) {

  int yearInitial = int.parse(dateInitial.substring(6, 10));
  int monthInitial = int.parse(dateInitial.substring(3, 5));
  int dayInitial = int.parse(dateInitial.substring(0, 2));

  int hourInitial = int.parse(dateInitial.substring(11, 13));
  int minuteInitial = int.parse(dateInitial.substring(14, 16));
  int secoundInitial = int.parse(dateInitial.substring(17, 19));

  int yearFinal = int.parse(dateFinal.substring(6, 10));
  int monthFinal = int.parse(dateFinal.substring(3, 5));
  int dayFinal = int.parse(dateFinal.substring(0, 2));

  int hourFinal = int.parse(dateFinal.substring(11, 13));
  int minuteFinal = int.parse(dateFinal.substring(14, 16));
  int secoundFinal = int.parse(dateFinal.substring(17, 19));

   return getTimeToString(DateTime(yearFinal, monthFinal,
          dayFinal, hourFinal, minuteFinal, secoundFinal)
      .difference(DateTime(yearInitial, monthInitial, dayInitial,
          hourInitial, minuteInitial, secoundInitial))
      .inSeconds);
}
