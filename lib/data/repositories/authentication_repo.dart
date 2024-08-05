import 'package:anniv_46_admin_app/features/authentication/screens/login/login.dart';
import 'package:anniv_46_admin_app/navigation_menu.dart';
import 'package:anniv_46_admin_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:anniv_46_admin_app/utils/exceptions/firebase_exceptions.dart';
import 'package:anniv_46_admin_app/utils/exceptions/format_exceptions.dart';
import 'package:anniv_46_admin_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final auth = FirebaseAuth.instance;

  User? get authUser => auth.currentUser;

  @override
  void onReady() async {
    Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = authUser;

    if (user != null) {
      Get.offAll(() => const NavigationMenu());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final userAccount = await GoogleSignIn().signIn();
      final googleAuth = await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );

      return await auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw MainFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MainFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw MainFormatException(e.message);
    } on PlatformException catch (e) {
      throw MainPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }
}
