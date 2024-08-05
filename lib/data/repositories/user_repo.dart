import 'package:anniv_46_admin_app/data/repositories/authentication_repo.dart';
import 'package:anniv_46_admin_app/features/personalization/models/user_model.dart';
import 'package:anniv_46_admin_app/utils/constants/texts.dart';
import 'package:anniv_46_admin_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:anniv_46_admin_app/utils/exceptions/firebase_exceptions.dart';
import 'package:anniv_46_admin_app/utils/exceptions/format_exceptions.dart';
import 'package:anniv_46_admin_app/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await db.collection(MainTexts.userDoc).doc(user.id).set(user.toJson());
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
      throw 'Something went wrong';
    }
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      final docSnapshot = await db
          .collection(MainTexts.userDoc)
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();

      if (docSnapshot.exists) {
        return UserModel.fromSnapshot(docSnapshot);
      } else {
        return UserModel.empty();
      }
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
      throw 'Something went wrong';
    }
  }

  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await db
          .collection(MainTexts.userDoc)
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
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
      throw 'Something went wrong';
    }
  }

  Future<void> removeUserDetails(String userId) async {
    try {
      await db.collection(MainTexts.userDoc).doc(userId).delete();
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
      throw 'Something went wrong';
    }
  }
}
