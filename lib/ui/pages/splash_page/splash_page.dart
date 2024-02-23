import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/locale_controller.dart';
import 'package:texnomart/data/controllers/splash_controller.dart';
import 'package:texnomart/di/controllers_di.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: splashController,
      builder: (GetxController controller) {
        print('Jahongir');
        print(Get.find<LocaleController>().locale.value);
        return Scaffold(
          backgroundColor: Colors.yellow.shade600,
          body: Center(
            child: Text(
              'texnomart*',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      },
    );
  }
}
