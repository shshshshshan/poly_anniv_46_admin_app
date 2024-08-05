
class ConvertSerialDate {
  static DateTime convert(double serialDate) {
    // Convert the serial date to days since the base date
    final baseDate = DateTime(1899, 12, 30);
    final daysSinceBaseDate = serialDate.floor();
    final timeFraction = serialDate - daysSinceBaseDate;

    final date = baseDate.add(Duration(days: daysSinceBaseDate));
    final time = Duration(milliseconds: (timeFraction * 24 * 60 * 60 * 1000).toInt());

    return date.add(time);
  }
}
