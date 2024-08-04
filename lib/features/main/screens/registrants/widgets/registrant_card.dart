import 'package:anniv_46_admin_app/common/widgets/loaders/loaders.dart';
import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:anniv_46_admin_app/utils/constants/enums.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrantCard extends StatelessWidget {
  const RegistrantCard({
    super.key,
    required this.gender,
    required this.name,
    required this.paymentStatus,
  });

  final Gender gender;
  final String name;
  final PaymentStatus paymentStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Future.delayed(const Duration(milliseconds: 135));
        Get.to(() => const Scaffold());
      },
      onLongPress: () => MainLoaders.successSnackbar(
          message: 'Tap for more information.', title: 'Tooltip'),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: MainSizes.sm),
          child: Row(
            children: [
              Expanded(child: Icon(gender.iconData, color: gender.color)),
              Expanded(
                  flex: 4,
                  child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: MainSizes.sm),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .apply(color: gender.color)),
                            Text.rich(TextSpan(
                                text: 'Payment Status: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .apply(color: MainColors.darkGrey),
                                children: [
                                  TextSpan(
                                      text: paymentStatus.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .apply(
                                              color: paymentStatus.color,
                                              fontStyle: FontStyle.italic))
                                ]))
                          ]))),
            ],
          ),
        ),
      ),
    );
  }
}
