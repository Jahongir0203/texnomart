import 'package:get/get.dart';
import 'package:texnomart/data/services/storage_service.dart';
import 'package:texnomart/data/utils/app_routes.dart';

class SplashController extends GetxController {
  final _isLoading = false.obs;
StorageService storageService=StorageService();
  RxBool get isLoading => _isLoading;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  startTimer() async {
    _isLoading.value = true;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (storageService.getLocale()!=null) {
          Get.offAllNamed(AppRoutes.mainPage);
        } else {
          Get.offNamed(AppRoutes.languagePage);
        }
      },
    );
    _isLoading.value = false;
  }
}
