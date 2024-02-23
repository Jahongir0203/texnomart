import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:texnomart/data/controllers/locale_controller.dart';
import 'package:texnomart/data/utils/app_routes.dart';
import 'package:texnomart/data/utils/init_controllers.dart';
import 'package:texnomart/data/utils/messages.dart';
import 'package:texnomart/firebase_options.dart';

void main() async {
  await GetStorage.init();
  initControllers();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController localeController=Get.find<LocaleController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      locale: localeController.locale.value,
      fallbackLocale: const Locale('uz', 'Uz'),
      initialRoute: AppRoutes.splashPage,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
