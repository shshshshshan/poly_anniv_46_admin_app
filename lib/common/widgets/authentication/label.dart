import 'package:flutter/material.dart';

class MainLabel extends StatelessWidget {
  const MainLabel({super.key, required this.labelText});

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(labelText, style: Theme.of(context).textTheme.labelMedium)
      ],
    );
  }
}
