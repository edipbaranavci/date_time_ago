import '../insterface/messages_interface.dart';
import '../messages/en_messages.dart';
import '../messages/tr_messages.dart';

part '../enum/date_time_ago_locale_enums.dart';

class DateTimeAgo {
  String toDateTimeAgo(
    DateTime date, {
    DateTimeAgoLocalesEnums locale = DateTimeAgoLocalesEnums.turkish,
    DateTime? clock,
    bool allowFromNow = true,
  }) {
    final allowFromNow0 = allowFromNow;
    final messages = locale == DateTimeAgoLocalesEnums.turkish
        ? TurkishMessages()
        : EnglishMessages();
    final clock0 = clock ?? DateTime.now();
    var elapsed = clock0.millisecondsSinceEpoch - date.millisecondsSinceEpoch;

    String prefix, suffix;

    if (allowFromNow0 && elapsed < 0) {
      elapsed = date.isBefore(clock0) ? elapsed : elapsed.abs();
      prefix = messages.prefixFromNow();
      suffix = messages.suffixFromNow();
    } else {
      prefix = messages.prefixAgo();
      suffix = messages.suffixAgo();
    }

    final result = _calculateResult(elapsed, messages);

    return [prefix, result, suffix]
        .where((str) => str.isNotEmpty)
        .join(messages.wordSeparator());
  }

  String _calculateResult(int elapsed, IMessages messages) {
    final num seconds = elapsed / 1000;
    final num minutes = seconds / 60;
    final num hours = minutes / 60;
    final num days = hours / 24;
    final num months = days / 30;
    final num years = days / 365;

    late final String result;
    if (seconds < 45) {
      result = messages.lessThanOneMinute(seconds.round());
    } else if (seconds < 90) {
      result = messages.aboutAMinute(minutes.round());
    } else if (minutes < 45) {
      result = messages.minutes(minutes.round());
    } else if (minutes < 90) {
      result = messages.aboutAnHour(minutes.round());
    } else if (hours < 24) {
      result = messages.hours(hours.round());
    } else if (hours < 48) {
      result = messages.aDay(hours.round());
    } else if (days < 30) {
      result = messages.days(days.round());
    } else if (days < 60) {
      result = messages.aboutAMonth(days.round());
    } else if (days < 365) {
      result = messages.months(months.round());
    } else if (years < 2) {
      result = messages.aboutAYear(months.round());
    } else {
      result = messages.years(years.round());
    }
    return result;
  }
}
