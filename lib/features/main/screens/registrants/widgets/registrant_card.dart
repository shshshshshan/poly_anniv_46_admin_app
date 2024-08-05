import 'package:anniv_46_admin_app/common/classes/registrant.dart';
import 'package:anniv_46_admin_app/common/widgets/loaders/loaders.dart';
import 'package:anniv_46_admin_app/features/main/screens/registrants/widgets/registrant_view.dart';
import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:anniv_46_admin_app/utils/constants/enums.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:anniv_46_admin_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrantCard extends StatelessWidget {
  const RegistrantCard({
    super.key,
    required this.registrant,
  });

  final Registrant registrant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Future.delayed(const Duration(milliseconds: 135));
        Get.to(() => RegistrantView(registrant: registrant));
      },
      onLongPress: () => MainLoaders.successSnackbar(
          message: 'Tap for more information.', title: 'Tooltip'),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: MainSizes.sm),
          child: Row(
            children: [
              Expanded(
                  child: Icon(registrant.gender.iconData,
                      color: registrant.gender.color)),
              Expanded(
                  flex: 4,
                  child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: MainSizes.sm),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(registrant.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .apply(color: registrant.gender.color)),
                            Text.rich(TextSpan(
                                text: '${MainTexts.paymentStatus}: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .apply(color: MainColors.darkGrey),
                                children: [
                                  TextSpan(
                                      text: registrant.paymentStatus.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .apply(
                                              color: registrant
                                                  .paymentStatus.color,
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
