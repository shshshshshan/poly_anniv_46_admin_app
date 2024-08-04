import 'package:anniv_46_admin_app/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class MainCurvedEdgesWidget extends StatelessWidget {
  const MainCurvedEdgesWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MainCustomCurvedEdges(),
      child: child,
    );
  }
}
