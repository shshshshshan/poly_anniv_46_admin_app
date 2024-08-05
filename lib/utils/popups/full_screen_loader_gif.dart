
import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:anniv_46_admin_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainFullScreenLoaderGif {
  static void openLoadingDialog(String title, String subtitle, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: HelperFunctions.isDarkMode(Get.context!)
              ? MainColors.dark
              : MainColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              Image(image: AssetImage(animation), width: HelperFunctions.screenSizeWidth() * 0.6),
              const SizedBox(height: MainSizes.sectionGap),

              // Title & Subtitle
              Text(
                title,
                style: Theme.of(Get.context!).textTheme.headlineMedium,
                textAlign: TextAlign.center
              ),

              const SizedBox(height: MainSizes.itemGap),

              Text(
                subtitle,
                style: Theme.of(Get.context!).textTheme.labelMedium,
                textAlign: TextAlign.center
              ),

            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
