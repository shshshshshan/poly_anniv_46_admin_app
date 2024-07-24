class MainPlatformException implements Exception {
  final String code;

  MainPlatformException(this.code);

  String get message {
    switch (code) {
      case 'platform-unavailable':
        return 'The requested platform feature is unavailable. Please check your device settings.';

      case 'platform-not-supported':
        return 'The platform does not support this feature.';

      case 'method-not-implemented':
        return 'The method is not implemented on the current platform.';

      case 'permission-denied':
        return 'Permission denied. Please grant the required permissions to proceed.';

      case 'missing-permission':
        return 'Required permission is missing. Please check your app permissions.';

      case 'feature-not-supported':
        return 'This feature is not supported on the current platform version.';

      case 'operation-failed':
        return 'The platform operation failed. Please try again.';

      case 'platform-timeout':
        return 'The platform operation timed out. Please try again.';

      case 'battery-optimization-disabled':
        return 'Battery optimization is disabled. Please enable it to proceed.';

      case 'service-unavailable':
        return 'The platform service is unavailable. Please check your device settings.';

      default:
        return 'An unknown platform error occurred. Please try again.';
    }
  }
}
