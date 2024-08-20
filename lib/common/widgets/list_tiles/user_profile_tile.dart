import 'package:anniv_46_admin_app/features/personalization/controllers/user_controller.dart';
import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainUserProfileTile extends StatelessWidget {
  const MainUserProfileTile({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return ListTile(
      leading: const SizedBox(width: 50, height: 50, child: Icon(CupertinoIcons.profile_circled, color: MainColors.white,)),
      title:
        Obx(
          () {
            final user = controller.user;
            final firstName = user.value.firstName;
            final lastName = user.value.lastName;

            return Text('$firstName $lastName',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: MainColors.white)
            );
          },
      ),

      subtitle:
        Obx(
          () {
            final user = controller.user;
            final email = user.value.email;

            return Text(email,
              style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: MainColors.white)
            );
          }
      )
    );
  }
}
