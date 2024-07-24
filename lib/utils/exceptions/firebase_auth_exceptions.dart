class MainFirebaseAuthException implements Exception {
  final String code;

  MainFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'email-already-exists':
        return 'The email address is already taken. Please use a different email address.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed in user.';
      case 'invalid-credential':
        return 'The supplied credential is invalid. Please try again.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support.';
      case 'invalid-user-token':
        return 'The user’s credential is no longer valid. The user must sign in again.';
      case 'network-request-failed':
        return 'A network error occurred. Please try again.';
      case 'too-many-requests':
        return 'We have blocked all requests from this device due to unusual activity. Try again later.';
      case 'user-token-expired':
        return 'The user’s credential has expired. Please sign in again.';
      case 'web-context-canceled':
        return 'The web operation was canceled by the user. Please try again.';
      case 'web-context-already-presented':
        return 'The web operation is already in progress. Please wait.';
      case 'web-storage-unsupported':
        return 'This browser is not supported or 3rd party cookies and data may be disabled.';
      case 'timeout':
        return 'The operation has timed out. Please try again.';
      case 'invalid-api-key':
        return 'The provided API key is invalid. Please check your configuration.';
      case 'app-not-authorized':
        return 'This app is not authorized to use Firebase Authentication. Please check your configuration.';
      case 'null-user':
        return 'No user is currently signed in. Please sign in and try again.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}
