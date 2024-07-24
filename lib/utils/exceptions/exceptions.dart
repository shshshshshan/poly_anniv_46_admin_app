class MainException implements Exception {
  final String code;

  MainException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown error occurred. Please try again.';

      case 'network-error':
        return 'A network error occurred. Please check your internet connection and try again.';

      case 'timeout':
        return 'The operation timed out. Please try again.';

      case 'unauthorized':
        return 'Unauthorized access. Please log in and try again.';

      case 'forbidden':
        return 'Forbidden access. You do not have permission to perform this action.';

      case 'not-found':
        return 'The requested resource was not found.';

      case 'conflict':
        return 'There was a conflict with the current state of the resource. Please try again.';

      case 'bad-request':
        return 'The request was invalid. Please check your input and try again.';

      case 'internal-server-error':
        return 'An internal server error occurred. Please try again later.';

      case 'service-unavailable':
        return 'The service is currently unavailable. Please try again later.';

      case 'rate-limit-exceeded':
        return 'Rate limit exceeded. Please slow down your requests.';

      case 'invalid-input':
        return 'The input provided is invalid. Please check your input and try again.';

      case 'data-error':
        return 'An error occurred with the data. Please try again.';

      case 'operation-failed':
        return 'The operation failed. Please try again.';

      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}
