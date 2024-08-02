import 'package:anniv_46_admin_app/features/authentication/controllers/login/login_controller.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:anniv_46_admin_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MainLoginForm extends StatelessWidget {
  const MainLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: MainSizes.sectionGap),
        child: Column(
          children: [
            // Username
            TextFormField(
              controller: controller.username,
              validator: null,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: MainTexts.username),
            ),

            const SizedBox(height: MainSizes.inputFieldGap),

            // Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: null,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: MainTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye
                            : Iconsax.eye_slash))),
              ),
            ),

            const SizedBox(height: MainSizes.inputFieldGap / 2),

            // Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    const Text(MainTexts.rememberMe),
                  ],
                ),

                // Forgot Password
                TextButton(
                    onPressed: () => {},
                    child: const Text(MainTexts.forgotPassword))
              ],
            ),

            const SizedBox(height: MainSizes.sectionGap),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.login(),
                  child: const Text(MainTexts.signIn)),
            ),
          ],
        ),
      ),
    );
  }
}
