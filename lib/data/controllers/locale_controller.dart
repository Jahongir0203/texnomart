import 'dart:ui';

import 'package:get/get.dart';
import 'package:texnomart/data/services/storage_service.dart';

class LocaleController extends GetxController {
  final StorageService _storageService;

  final _isLoading = false.obs;
  final _locale = Locale('uz', 'UZ').obs;

  LocaleController(this._storageService);

  RxBool get isLoading => _isLoading;

  Rx<Locale?> get locale => _locale;

  saveLocale(Locale? locale) {
    this._locale.value = locale!;
    _storageService.saveLocale(locale);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    var locale = _storageService.getLocale();
    if (locale != null) {
      this._locale.value = locale;
    } else {
      _locale.value = const Locale('uz', 'UZ');
    }

    super.onInit();
  }
}
