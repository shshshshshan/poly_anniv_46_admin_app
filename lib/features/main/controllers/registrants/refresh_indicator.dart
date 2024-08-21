import 'package:anniv_46_admin_app/features/main/controllers/registrants/registrant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';

class RegistrantsRefreshIndicatorController extends GetxController {
  RegistrantsRefreshIndicatorController get instance => Get.find();

  final key = GlobalKey<LiquidPullRefreshState>();

  onRefresh() async {
    await RegistrantController.instance.fetchRegistrants();
  }
}
