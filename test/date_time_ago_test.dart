// ignore_for_file: avoid_print

import 'package:date_time_ago/src/date_time_ago/date_time_ago.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Run The DateTimeAgo', () {
    final dateTimeAgo = DateTimeAgo();
    final dateTime = DateTime.now().subtract(const Duration(days: 1));
    print(dateTimeAgo.toCalculate(dateTime));
    print(dateTimeAgo.toCalculate(
      dateTime,
      locale: DateTimeAgoLocalesEnums.english,
    ));
  });
}
