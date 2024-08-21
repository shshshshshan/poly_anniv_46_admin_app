import 'package:anniv_46_admin_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:anniv_46_admin_app/common/widgets/texts/section_heading.dart';
import 'package:anniv_46_admin_app/features/main/controllers/dashboard/main_scroll.dart';
import 'package:anniv_46_admin_app/features/main/controllers/dashboard/payment_stats_controller.dart';
import 'package:anniv_46_admin_app/features/main/controllers/dashboard/refresh_indicator.dart';
import 'package:anniv_46_admin_app/features/main/controllers/registrants/registrant_controller.dart';
import 'package:anniv_46_admin_app/features/main/screens/dashboard/widgets/home_app_bar.dart';
import 'package:anniv_46_admin_app/features/main/screens/dashboard/widgets/payment_stats.dart';
import 'package:anniv_46_admin_app/features/main/screens/dashboard/widgets/recent_payments.dart';
import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:anniv_46_admin_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';
import 'package:flutter/material.dart';

class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final refreshIndicatorController = Get.put(DashboardRefreshIndicatorController());
    final scrollController = Get.put(DashboardScrollController());

    return Scaffold(
      body: LiquidPullRefresh(
        key: refreshIndicatorController.key,
        height: 100.0,
        backgroundColor: dark ? MainColors.black : MainColors.white,
        showChildOpacityTransition: false,
        color: MainColors.primary,
        animSpeedFactor: 3.0,
        onRefresh: () => refreshIndicatorController.onRefresh(),
        child: ListView(
          controller: scrollController.controller,
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                MainPrimaryHeaderContainer(
                  child: Column(
                    children: [
                      // Header
                      const MainHomeAppBar(),

                      Divider(
                          color: MainColors.black.withOpacity(0.1),
                          indent: MainSizes.md,
                          endIndent: MainSizes.md),

                      const SizedBox(height: MainSizes.itemGap),

                      // Stats
                      const PaymentStats(),

                      const SizedBox(height: MainSizes.sectionGap)
                    ],
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: MainSizes.defaultSpace),
                  child: Column(children: [
                    MainSectionHeading(
                        title: 'Recent Payments', showActionButton: false),
                  ]),
                ),
                const SizedBox(height: MainSizes.sectionGap),
                const RecentPayments(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
