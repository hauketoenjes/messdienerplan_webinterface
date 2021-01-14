import 'package:messdienerplan_webinterface/api/model/models.dart';

enum DrawerItem {
  ACOLYTE,
  PLAN,
  LOCATION,
  GROUP,
  ROLE,
  TYPE,
  DASHBOARD,
  SETTINGS,
  WHATSNEW
}

extension TitleExtension on DrawerItem {
  String get title {
    switch (this) {
      case DrawerItem.DASHBOARD:
        return 'Dashboard';
        break;
      case DrawerItem.ACOLYTE:
        return 'Messdiener';
        break;
      case DrawerItem.PLAN:
        return 'Pläne';
        break;
      case DrawerItem.LOCATION:
        return 'Orte';
        break;
      case DrawerItem.GROUP:
        return 'Gruppen';
        break;
      case DrawerItem.ROLE:
        return 'Rollen';
        break;
      case DrawerItem.TYPE:
        return 'Messetypen';
        break;
      case DrawerItem.SETTINGS:
        return 'Einstellungen';
        break;
      case DrawerItem.WHATSNEW:
        return 'Was ist neu?';
        break;
      default:
        return '';
        break;
    }
  }
}

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
