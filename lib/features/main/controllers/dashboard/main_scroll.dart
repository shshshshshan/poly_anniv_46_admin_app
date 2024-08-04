import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScrollController extends GetxController {
  DashboardScrollController get instance => Get.find();

  final controller = ScrollController();
}
