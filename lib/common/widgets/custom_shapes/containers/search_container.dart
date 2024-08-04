import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:anniv_46_admin_app/utils/device/device_utility.dart';
import 'package:anniv_46_admin_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MainSearchContainer extends StatelessWidget {
  const MainSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: MainSizes.defaultSpace)
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: MainDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(MainSizes.md),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? MainColors.dark
                      : MainColors.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(MainSizes.cardRadiusLg),
              border: showBorder
                  ? Border.all(color: dark ? MainColors.light : MainColors.grey)
                  : null),
          child: Row(
            children: [
              Icon(icon, color: dark ? MainColors.light : MainColors.darkerGrey),
              const SizedBox(width: MainSizes.itemGap),
              Text(text, style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ),
      ),
    );
  }
}
