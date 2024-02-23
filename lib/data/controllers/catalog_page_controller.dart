import 'package:get/get.dart';
import 'package:texnomart/data/services/network_service.dart';

import '../models/catalog_page_model.dart';

class CatalogController extends GetxController {
  final NetworkService _networkService;
  final _isLoading = false.obs;
  late CatalogPageModel catalogPageModel;

  CatalogController(this._networkService);

  RxBool get isLoading => _isLoading;

  getCatalogs() async {
    _isLoading.value = true;
    var catalogResponse = await _networkService.getCatalogs();
    catalogPageModel = catalogResponse;
    _isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
  getCatalogs();

  }
}
