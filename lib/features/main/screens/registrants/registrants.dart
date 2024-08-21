import 'package:anniv_46_admin_app/common/widgets/appbar/appbar.dart';
import 'package:anniv_46_admin_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:anniv_46_admin_app/common/widgets/tooltip/tooltip.dart';
import 'package:anniv_46_admin_app/features/main/controllers/registrants/main_scroll.dart';
import 'package:anniv_46_admin_app/features/main/controllers/registrants/refresh_indicator.dart';
import 'package:anniv_46_admin_app/features/main/controllers/registrants/registrant_controller.dart';
import 'package:anniv_46_admin_app/features/main/models/registrants/registrant.dart';
import 'package:anniv_46_admin_app/features/main/screens/registrants/widgets/registrant_card.dart';
import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:anniv_46_admin_app/utils/constants/texts.dart';
import 'package:anniv_46_admin_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';

class MainRegistrants extends StatelessWidget {
  const MainRegistrants({super.key});

  @override
  Widget build(BuildContext context) {
    final refreshIndicatorController = Get.put(RegistrantsRefreshIndicatorController());
    final scrollController = Get.put(RegistrantsScrollController());
    final registrantController = RegistrantController.instance;
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
        appBar: MainAppBar(
            title: Text(MainTexts.registrantsAppbarTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            actions: [
              MainTooltip(
                  message: 'Refresh data',
                  child: IconButton(
                      icon: Icon(Iconsax.refresh,
                          color: dark ? MainColors.white : MainColors.dark),
                      onPressed: () {
                        scrollController.controller.animateTo(
                            scrollController .controller.position.minScrollExtent - 300,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                        refreshIndicatorController.key.currentState?.show();
                      }))
            ]),
        body: LiquidPullRefresh(
          key: refreshIndicatorController.key,
          backgroundColor: dark ? MainColors.black : MainColors.white,
          showChildOpacityTransition: false,
          color: MainColors.primary,
          animSpeedFactor: 3.0,
          height: 100.0,
          onRefresh: () => refreshIndicatorController.onRefresh(),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController.controller,
            children: [
              Column(children: [
                const SizedBox(height: MainSizes.itemGap),
                MainSearchContainer(
                    text: MainTexts.registrantsSearchBarLabel, onTap: () {})
              ]),

              const SizedBox(height: MainSizes.sectionGap),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: MainSizes.defaultSpace),
                child: Obx(
                  () => Column(
                    children: registrantController.registrants.map((registrant) => RegistrantCard(registrant: registrant ?? Registrant.empty())).toList(),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
