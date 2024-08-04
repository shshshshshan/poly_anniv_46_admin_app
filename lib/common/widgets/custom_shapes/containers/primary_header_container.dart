import 'package:anniv_46_admin_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:anniv_46_admin_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:anniv_46_admin_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MainPrimaryHeaderContainer extends StatelessWidget {
  const MainPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MainCurvedEdgesWidget(
      child: SizedBox(
        child: Container(
          color: MainColors.primary,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: MainCircularContainer(
                    backgroundColor: MainColors.textWhite.withOpacity(0.1)),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: MainCircularContainer(
                    backgroundColor: MainColors.textWhite.withOpacity(0.1)),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
