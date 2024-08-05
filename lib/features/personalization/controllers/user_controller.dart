import 'package:anniv_46_admin_app/common/widgets/loaders/loaders.dart';
import 'package:anniv_46_admin_app/data/repositories/user_repo.dart';
import 'package:anniv_46_admin_app/features/personalization/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final user = userCredentials.user!;
        final displayName = user.displayName ?? '';
        final nameParts = UserModel.nameParts(displayName);
        final username = UserModel.generateUsername(displayName);

        final userModel = UserModel(
            id: user.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: user.email ?? '',
            phoneNumber: user.phoneNumber ?? '',
            profilePicture: user.photoURL ?? '');

        await userRepository.saveUserRecord(userModel);
      }
    } catch (e) {
      MainLoaders.warningSnackbar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile.');
      if (kDebugMode) print('Something went wrong: $e');
    }
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;

      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
      if (kDebugMode) print('Something went wrong: $e');
    } finally {
      profileLoading.value = false;
    }
  }
}
