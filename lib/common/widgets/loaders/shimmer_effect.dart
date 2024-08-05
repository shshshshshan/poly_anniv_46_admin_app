import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:anniv_46_admin_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MainShimmerLoader extends StatelessWidget {
  const MainShimmerLoader({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? MainColors.darkerGrey : MainColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
