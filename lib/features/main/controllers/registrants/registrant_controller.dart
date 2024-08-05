import 'package:anniv_46_admin_app/data/services/registrants_sheets_api.dart';
import 'package:anniv_46_admin_app/features/main/models/registrants/registrant.dart';
import 'package:get/get.dart';

class RegistrantController extends GetxController {
  static RegistrantController get instance => Get.find();

  final registrants = <Registrant>[].obs;

  int get totalRegistrants => registrants.length;

  @override
  void onInit() {
    super.onInit();
    fetchRegistrants();
  }

  Future<void> fetchRegistrants() async {
    registrants.value = await RegistrantsSheetsApi.getAllRegistrants();
  }
}
