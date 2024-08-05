import 'package:anniv_46_admin_app/common/classes/navigation_destination_item.dart';
import 'package:anniv_46_admin_app/features/main/screens/dashboard/dashboard.dart';
import 'package:anniv_46_admin_app/features/main/screens/registrants/registrants.dart';
import 'package:anniv_46_admin_app/features/personalization/screens/personalization.dart';
import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:anniv_46_admin_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: MainColors.grey, blurRadius: dark ? 0 : 5)
          ]),
          child: NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: dark ? MainColors.black : MainColors.white,
            indicatorColor: Colors.transparent,
            destinations: List.generate(
                controller.screens.length,
                (index) => NavigationDestination(
                    icon: Icon(controller.screens[index].iconData,
                        color: controller.selectedIndex.value == index
                            ? MainColors.primary
                            : null,
                        size: MainSizes.iconSm),
                    label: controller.screens[index].name)),
          ),
        ),
      ),
      body:
          Obx(() => controller.screens[controller.selectedIndex.value].widget),
    );
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();

  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    NavigationDestinationItem(
        widget: const MainDashboard(), iconData: Iconsax.home),
    NavigationDestinationItem(
        widget: const MainRegistrants(), iconData: Iconsax.user),
    NavigationDestinationItem(
        widget: const PersonalizationScreen(),
        iconData: Iconsax.setting_2),
  ];

  setSelectedIndex(int index) {
    if (index >= screens.length) return;

    selectedIndex.value = index;
  }
}
