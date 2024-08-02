import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:anniv_46_admin_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDivider extends StatelessWidget {
  const MainDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final bool dark = HelperFunctions.isDarkMode(context);

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Flexible(
          child: Divider(
              color: dark ? MainColors.darkGrey : MainColors.grey,
              thickness: 0.5,
              indent: 60,
              endIndent: 5)),
      Text(dividerText.capitalize!,
          style: Theme.of(context).textTheme.labelMedium),
      Flexible(
          child: Divider(
              color: dark ? MainColors.darkGrey : MainColors.grey,
              thickness: 0.5,
              indent: 5,
              endIndent: 60)),
    ]);
  }
}
