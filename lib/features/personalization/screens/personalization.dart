import 'package:anniv_46_admin_app/features/authentication/controllers/login/login_controller.dart';
import 'package:anniv_46_admin_app/features/personalization/controllers/user_controller.dart';
import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalizationScreen extends StatelessWidget {
  const PersonalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final loginController = Get.put(LoginController());

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () => loginController.logout(),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: MainColors.error,
                    side: const BorderSide(width: 0)),
                child: Text('Logout',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: MainColors.white))),
          ),
        ],
      ),
    );
  }
}
