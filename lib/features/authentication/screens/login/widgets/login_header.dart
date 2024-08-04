import 'package:anniv_46_admin_app/utils/constants/image_strings.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:anniv_46_admin_app/utils/constants/texts.dart';
import 'package:anniv_46_admin_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MainLoginHeader extends StatelessWidget {
  const MainLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Image(
            height: 200,
            image: AssetImage(
                dark ? MainImages.darkAppLogo : MainImages.lightAppLogo),
          ),
        ),
        const SizedBox(height: MainSizes.lg),
        Text(MainTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: MainSizes.sm),
        Text(MainTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
