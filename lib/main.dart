import 'package:anniv_46_admin_app/app.dart';
import 'package:anniv_46_admin_app/data/repositories/authentication_repo.dart';
import 'package:anniv_46_admin_app/data/services/registrants_sheets_api.dart';
import 'package:anniv_46_admin_app/features/main/controllers/registrants/registrant_controller.dart';
import 'package:anniv_46_admin_app/firebase_options.dart';
import 'package:anniv_46_admin_app/utils/constants/texts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await dotenv.load(fileName: MainTexts.dotenvFile);

  await RegistrantsSheetsApi.init();
  Get.put(RegistrantController());

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
    .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const App());
}
