class MainFormatException implements Exception {
  final String message;

  const MainFormatException([this.message = 'An unexpected format error occurred. Please check your input.']);

  factory MainFormatException.fromMessage(String message) {
    return MainFormatException(message);
  }

  String get formattedMessage => message;

  factory MainFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const MainFormatException('The email address format is invalid. Please enter a valid email.');

      case 'invalid-phone-number-format':
        return const MainFormatException('The phone number format is invalid. Please enter a valid phone number.');

      case 'invalid-date-format':
        return const MainFormatException('The date format is invalid. Please use the format YYYY-MM-DD.');

      case 'invalid-url-format':
        return const MainFormatException('The URL format is invalid. Please enter a valid URL.');

      case 'invalid-credit-card-format':
        return const MainFormatException('The credit card number format is invalid. Please enter a valid credit card number.');

      case 'invalid-zip-code-format':
        return const MainFormatException('The ZIP code format is invalid. Please enter a valid ZIP code.');

      case 'invalid-ssn-format':
        return const MainFormatException('The Social Security Number format is invalid. Please enter a valid SSN.');

      case 'invalid-ip-address-format':
        return const MainFormatException('The IP address format is invalid. Please enter a valid IP address.');

      case 'invalid-hex-color-format':
        return const MainFormatException('The hex color format is invalid. Please enter a valid hex color code.');

      case 'invalid-username-format':
        return const MainFormatException('The username format is invalid. Usernames can only contain alphanumeric characters and underscores.');

      case 'invalid-password-format':
        return const MainFormatException('The password format is invalid. Passwords must be at least 6 characters long and include a mix of letters, numbers, and special characters.');

      default:
        return const MainFormatException('An unknown format error occurred. Please check your input.');
    }
  }
}
