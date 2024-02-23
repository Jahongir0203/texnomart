import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/bags_controller.dart';
import 'package:texnomart/data/controllers/catalog_page_controller.dart';
import 'package:texnomart/data/controllers/cities_controller.dart';
import 'package:texnomart/data/controllers/detailPage_controller.dart';
import 'package:texnomart/data/controllers/main_controller.dart';

import '../controllers/homePage_controller.dart';
import '../controllers/locale_controller.dart';
import '../services/network_service.dart';
import '../services/storage_service.dart';

initControllers() {
  Get.put(LocaleController(StorageService()));
  Get.put(MainController());
  Get.put(HomeController(NetworkService(Dio())));
  Get.put(CatalogController(NetworkService(Dio())));
  Get.put(BagsController(StorageService()));
  Get.put(BagsController(StorageService()));
  Get.put(CitiesController());
  Get.put(DetailController(NetworkService(Dio())));
}
