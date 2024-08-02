import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:anniv_46_admin_app/utils/constants/image_strings.dart';
import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: MainColors.grey),
            borderRadius: BorderRadius.circular(100)),
        child: IconButton(
          onPressed: () {},
          icon: const Image(
              width: MainSizes.iconMd,
              height: MainSizes.iconMd,
              image: AssetImage(MainImages.googleIcon)),
        ),
      )
    ]);
  }
}
