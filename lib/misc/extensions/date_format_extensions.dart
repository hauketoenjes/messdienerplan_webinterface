import 'package:intl/intl.dart';

extension DateFormats on DateFormat {
  static DateFormat yyyyMMdd([String? locale]) {
    return DateFormat('dd.MM.yyyy', locale);
  }
}
