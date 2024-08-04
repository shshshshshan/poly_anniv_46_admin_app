import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';

class RegistrantsRefreshIndicatorController extends GetxController {
  RegistrantsRefreshIndicatorController get instance => Get.find();

  final key = GlobalKey<LiquidPullRefreshState>();
}
