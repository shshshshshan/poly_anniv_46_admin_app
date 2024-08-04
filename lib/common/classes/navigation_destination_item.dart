import 'package:flutter/material.dart';

class NavigationDestinationItem {
  NavigationDestinationItem(
      {required this.name, required this.widget, required this.iconData});

  final String name;
  final Widget widget;
  final IconData iconData;
}
