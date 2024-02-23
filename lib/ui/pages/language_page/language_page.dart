import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/locale_controller.dart';
import 'package:texnomart/data/utils/app_routes.dart';

class LanguagePage extends StatelessWidget {
  LanguagePage({Key? key}) : super(key: key);
  LocaleController localeController = Get.find<LocaleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 120,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildLanguageButton(
              "O'zbek",
              () {
                localeController.saveLocale(
                  const Locale('uz', 'UZ'),
                );
                Get.offAllNamed(AppRoutes.mainPage);
                print(localeController.locale.value);
              },
            ),
            buildLanguageButton(
              "Узбек",
              () {
                localeController.saveLocale(
                  const Locale('uz', 'Cyrl'),
                );
                Get.offAllNamed(AppRoutes.mainPage);
                print(localeController.locale.value);
              },
            ),
            buildLanguageButton(
              "Русский",
              () {
                localeController.saveLocale(
                  const Locale('ru', 'RU'),
                );
                Get.offAllNamed(AppRoutes.mainPage);
                print(localeController.locale.value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding buildLanguageButton(String language, Function onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: InkWell(
        splashColor: Colors.yellow,
        onTap: () {
          onTap();
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black),
          ),
          child: Center(
            child: Text(language),
          ),
        ),
      ),
    );
  }
}
