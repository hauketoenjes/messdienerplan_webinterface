import 'package:messdienerplan_webinterface/api/model/models.dart';

///
/// Extension um die Wochentage als String zu bekommen.
///
extension DayOfWeekExtension on DayOfWeek {
  String get value {
    switch (this) {
      case DayOfWeek.mon:
        return 'Montag';
        break;
      case DayOfWeek.tue:
        return 'Dienstag';
        break;
      case DayOfWeek.wed:
        return 'Mittwoch';
        break;
      case DayOfWeek.thu:
        return 'Donnerstag';
        break;
      case DayOfWeek.fri:
        return 'Freitag';
        break;
      case DayOfWeek.sat:
        return 'Samstag';
        break;
      case DayOfWeek.sun:
        return 'Sonntag';
        break;
      default:
        return '';
        break;
    }
  }
}
