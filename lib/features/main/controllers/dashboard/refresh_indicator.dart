import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';

class DashboardRefreshIndicatorController extends GetxController {
  DashboardRefreshIndicatorController get instance => Get.find();

  final key = GlobalKey<LiquidPullRefreshState>();
}
