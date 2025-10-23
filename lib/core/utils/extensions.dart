import 'package:intl/intl.dart';

/// String 확장 메서드
extension StringExtensions on String {
  /// yy.MM 형식으로 포맷팅 (예: '202510' -> '25.10')
  String toFormattedMonth() {
    try {
      final String year = substring(0, 4);
      final String month = substring(4, 6);
      final DateTime dateTime = DateTime.parse('$year-$month-01');
      return DateFormat('yy.MM').format(dateTime);
    } catch (_) {
      return this;
    }
  }

  /// yy.MM.dd 형식으로 포맷팅 (예: '20251011' -> '25.10.11')
  String toFormattedDay() {
    try {
      final String year = substring(0, 4);
      final String month = substring(4, 6);
      final String day = substring(6, 8);
      final DateTime dateTime = DateTime.parse('$year-$month-$day');
      return DateFormat('yy.MM.dd').format(dateTime);
    } catch (_) {
      return this;
    }
  }
}

/// DateTime 확장 메서드
extension DateTimeExtensions on DateTime {
  /// yyyy.MM.dd hh:mm:ss 형식으로 포맷팅 (예: '2025-10-13T06:00:27.000+09:00' -> '2025.10.11 10:10:10')
  String toFormattedDateTime() {
    return DateFormat('yyyy.MM.dd hh:mm:ss').format(this);
  }
}
