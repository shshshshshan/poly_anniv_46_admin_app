import 'package:anniv_46_admin_app/app.dart';
import 'package:anniv_46_admin_app/data/repositories/authentication_repo.dart';
import 'package:anniv_46_admin_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
    .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const App());
}
