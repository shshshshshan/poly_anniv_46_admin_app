import 'package:anniv_46_admin_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MainProfileMenu extends StatelessWidget {
  const MainProfileMenu({
    super.key,
    this.icon = Iconsax.arrow_right_34,
    this.onPressed,
    required this.title,
    required this.value,
    this.textColor
  });

  final IconData? icon;
  final VoidCallback? onPressed;
  final String title, value;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: MainSizes.itemGap / 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(title,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis),
            ),
            Expanded(
              flex: 5,
              child: Text(value,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(color: textColor),
                  overflow: TextOverflow.ellipsis),
            ),
            Expanded(child: Icon(icon, size: 18)),
          ],
        ),
      ),
    );
  }
}
