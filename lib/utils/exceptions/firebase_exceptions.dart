class MainFirebaseException implements Exception {
  final String code;

  MainFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occurred. Please try again.';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token.';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
      case 'invalid-credential':
        return 'The supplied auth credential is malformed or has expired.';
      case 'user-disabled':
        return 'The user account has been disabled by an administrator.';
      case 'user-token-expired':
        return 'The user\'s credential has expired. Please sign in again.';
      case 'invalid-user-token':
        return 'The user\'s credential is no longer valid. Please sign in again.';
      case 'user-not-found':
        return 'There is no user record corresponding to this identifier. The user may have been deleted.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'operation-not-allowed':
        return 'The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console.';
      case 'weak-password':
        return 'The password must be 6 characters long or more.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'email-already-exists':
        return 'The email address is already taken. Please use a different email address.';
      case 'invalid-password':
        return 'The password is invalid or the user does not have a password.';
      case 'wrong-password':
        return 'The password is invalid or the user does not have a password.';
      case 'too-many-requests':
        return 'We have blocked all requests from this device due to unusual activity. Try again later.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'provider-already-linked':
        return 'This user is already linked to this provider.';
      case 'no-such-provider':
        return 'The user does not have a provider linked to this account.';
      case 'invalid-verification-code':
        return 'The verification code used to create the phone auth credential is invalid.';
      case 'invalid-verification-id':
        return 'The verification ID used to create the phone auth credential is invalid.';
      case 'missing-verification-code':
        return 'The phone auth credential was created with an empty SMS verification code.';
      case 'missing-verification-id':
        return 'The phone auth credential was created with an empty verification ID.';
      case 'session-expired':
        return 'The SMS code has expired. Please re-send the verification code to try again.';
      case 'quota-exceeded':
        return 'The SMS quota for this project has been exceeded.';
      case 'invalid-app-credential':
        return 'The phone verification request contains an invalid application verifier.';
      case 'invalid-phone-number':
        return 'The phone number format is incorrect. Please enter a valid phone number.';
      case 'network-request-failed':
        return 'A network error (such as timeout, interrupted connection, or unreachable host) has occurred.';
      case 'timeout':
        return 'The operation has timed out. Please try again.';
      case 'web-storage-unsupported':
        return 'This browser is not supported or 3rd party cookies and data may be disabled.';
      case 'web-context-canceled':
        return 'The web operation was canceled by the user.';
      case 'web-context-already-presented':
        return 'The web operation is already in progress.';
      case 'invalid-api-key':
        return 'Your API key is invalid, please check you have copied it correctly.';
      case 'app-not-authorized':
        return 'This app is not authorized to use Firebase Authentication. Please verify the correct package name and SHA-1 are configured in the Firebase Console.';
      case 'null-user':
        return 'No user is currently signed in.';
      default:
        return 'An unknown Firebase error occurred. Please try again.';
    }
  }
}
