import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';

class RefreshIndicatorController extends GetxController {
  RefreshIndicatorController get instance => Get.find();

  final key = GlobalKey<LiquidPullRefreshState>();
}
