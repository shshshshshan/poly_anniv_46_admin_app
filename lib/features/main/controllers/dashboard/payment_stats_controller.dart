import 'package:anniv_46_admin_app/features/main/controllers/registrants/registrant_controller.dart';
import 'package:anniv_46_admin_app/features/main/models/registrants/registrant.dart';
import 'package:anniv_46_admin_app/utils/constants/enums.dart';
import 'package:get/get.dart';

class PaymentStatsController extends GetxController {
  static PaymentStatsController get instance => Get.find();

  final pendingPayments = 0.obs;
  final verifiedPayments = 0.obs;
  final registrantController = RegistrantController.instance;

  @override
  void onInit() {
    super.onInit();
    updateAll();
  }

  updateAll() {
    updatePendingPaymentsCount();
    updateVerifiedPaymentsCount();
  }

  updatePendingPaymentsCount() {
    pendingPayments.value = 0;
    for (Registrant? registrant in registrantController.registrants) {
      if (registrant?.paymentStatus == PaymentStatus.pending) {
        pendingPayments.value++;
      }
    }
  }

  updateVerifiedPaymentsCount() {
    verifiedPayments.value = 0;
    for (Registrant? registrant in registrantController.registrants) {
      if (registrant?.paymentStatus == PaymentStatus.successful) {
        verifiedPayments.value++;
      }
    }
  }
}
