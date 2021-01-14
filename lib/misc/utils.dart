class Utils {
  ///
  /// Berechnet das Alter zu einem [birthDate]
  ///
  /// Es kann optional eine [now] DateTime angeben werden, wenn extrem häufig
  /// das Alter berechnet wird, und nicht jedes mal die aktuelle Zeit abgerufen
  /// werden soll.
  ///
  static int calculateAge(DateTime birthDate, {DateTime now}) {
    var currentDate = now ?? DateTime.now();

    var age = currentDate.year - birthDate.year;
    var month1 = currentDate.month;
    var month2 = birthDate.month;

    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      var day1 = currentDate.day;
      var day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}
