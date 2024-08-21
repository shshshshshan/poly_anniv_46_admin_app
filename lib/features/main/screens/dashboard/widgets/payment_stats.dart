import 'package:animated_digit/animated_digit.dart';
import 'package:anniv_46_admin_app/features/main/controllers/dashboard/payment_stats_controller.dart';
import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:anniv_46_admin_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentStats extends StatelessWidget {
  const PaymentStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = PaymentStatsController.instance;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MainSizes.md * 2),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(MainTexts.pendingPayments,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: MainColors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            const SizedBox(height: MainSizes.itemGap),
            Obx(
              () => AnimatedDigitWidget(
                  duration: const Duration(milliseconds: 700),
                  value: controller.pendingPayments.value,
                  textStyle: Theme.of(context).textTheme.headlineLarge!.apply(
                      fontSizeDelta: MainSizes.lg * 2,
                      color: MainColors.white)),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(MainTexts.verifiedPayments,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: MainColors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            const SizedBox(height: MainSizes.itemGap),
            Obx(
              () => AnimatedDigitWidget(
                  duration: const Duration(milliseconds: 700),
                  value: controller.verifiedPayments.value,
                  textStyle: Theme.of(context).textTheme.headlineLarge!.apply(
                      fontSizeDelta: MainSizes.lg * 2,
                      color: MainColors.white)),
            )
          ],
        ),
      ]),
    );
  }
}
