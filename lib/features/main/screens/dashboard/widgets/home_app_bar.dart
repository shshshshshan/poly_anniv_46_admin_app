import 'package:anniv_46_admin_app/common/widgets/appbar/appbar.dart';
import 'package:anniv_46_admin_app/common/widgets/tooltip/tooltip.dart';
import 'package:anniv_46_admin_app/features/main/controllers/dashboard/main_scroll.dart';
import 'package:anniv_46_admin_app/features/main/controllers/dashboard/refresh_indicator.dart';
import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:anniv_46_admin_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MainHomeAppBar extends StatelessWidget {
  const MainHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final refreshIndicatorController = Get.put(RefreshIndicatorController());
    final scrollController = Get.put(MainScrollController());

    return MainAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(MainTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: MainColors.white)),
          Text(MainTexts.homeAppbarSubtitle,
              style: Theme.of(context).textTheme.bodyLarge!.apply(
                  color: MainColors.white,
                  fontWeightDelta: FontWeight.w600.value)),
        ],
      ),
      actions: [
        MainTooltip(
            message: 'Refresh data',
            child: IconButton(
                icon: const Icon(Iconsax.refresh, color: MainColors.white),
                onPressed: () {
                  scrollController.controller.animateTo(
                      scrollController.controller.position.minScrollExtent -
                          300,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear);
                  refreshIndicatorController.key.currentState?.show();
                }))
      ],
    );
  }
}
