import 'package:intl/intl.dart';

class MainFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('MMMM d, y').format(date);
  }

  static String formatDateTime(DateTime? dateTime) {
    dateTime ??= DateTime.now();
    return DateFormat('MMMM d, y h:mm:ss a').format(dateTime);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en-PH', symbol: '₱').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 7)} ${phoneNumber.substring(7)}';
    } else if (phoneNumber.length == 11) {
      return '${phoneNumber.substring(0, 4)} ${phoneNumber.substring(4, 8)} ${phoneNumber.substring(8)}';
    }

    return phoneNumber;
  }
}
