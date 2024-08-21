import 'package:anniv_46_admin_app/features/main/controllers/dashboard/payment_stats_controller.dart';
import 'package:anniv_46_admin_app/features/main/controllers/registrants/registrant_controller.dart';
import 'package:anniv_46_admin_app/utils/network/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(RegistrantController());
    Get.put(PaymentStatsController());
  }
}
