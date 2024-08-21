import 'package:anniv_46_admin_app/common/widgets/appbar/appbar.dart';
import 'package:anniv_46_admin_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:anniv_46_admin_app/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:anniv_46_admin_app/common/widgets/placeholders/content_placeholder.dart';
import 'package:anniv_46_admin_app/common/widgets/texts/section_heading.dart';
import 'package:anniv_46_admin_app/features/authentication/controllers/login/login_controller.dart';
import 'package:anniv_46_admin_app/features/personalization/controllers/user_controller.dart';
import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:anniv_46_admin_app/utils/constants/enums.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class PersonalizationScreen extends StatelessWidget {
  const PersonalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final loginController = Get.put(LoginController());

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      MainPrimaryHeaderContainer(
        child: Obx(
          () => Column(children: [
            MainAppBar(
              title: Text('Account',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: MainColors.white)),
            ),
            if (userController.profileLoading.value)
              Padding(
                padding: const EdgeInsets.only(left: MainSizes.sm),
                child: Shimmer.fromColors(
                    baseColor: const Color(0xFFA6D2F6),
                    highlightColor: const Color(0xFFCDE9FF),
                    child: const ContentPlaceholder(
                        lineType: ContentLineType.twoLines)),
              )
            else
              const Padding(
                  padding: EdgeInsets.only(left: MainSizes.sm),
                  child: MainUserProfileTile()),
            const SizedBox(height: MainSizes.sectionGap)
          ]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(MainSizes.defaultSpace),
        child: Column(
          children: [
            const MainSectionHeading(title: 'Logout', showActionButton: false),

            const SizedBox(height: MainSizes.itemGap),

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
      )
    ])));
  }
}
