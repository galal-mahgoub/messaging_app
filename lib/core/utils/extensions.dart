import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime? {
  String get appDateFormat {
    if (this == null) {
      return '';
    }

    return DateFormat('MMM d, ').add_jm().format(this!);
  }
}
