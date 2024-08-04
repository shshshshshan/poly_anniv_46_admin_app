import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScrollController extends GetxController {
  MainScrollController get instance => Get.find();

  final controller = ScrollController();
}
