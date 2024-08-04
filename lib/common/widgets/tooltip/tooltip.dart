import 'package:flutter/material.dart';

class MainTooltip extends StatefulWidget {
  const MainTooltip({super.key, required this.message, required this.child});

  final String message;
  final Widget child;

  @override
  State<MainTooltip> createState() => MainTooltipState();
}

class MainTooltipState extends State<MainTooltip> {
  final key = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return Tooltip(
        key: key,
        triggerMode: TooltipTriggerMode.longPress,
        showDuration: const Duration(seconds: 2),
        message: widget.message,
        child: widget.child);
  }
}
