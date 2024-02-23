import 'package:get/get.dart';
import 'package:texnomart/data/services/network_service.dart';

import '../models/brands_model.dart';
import '../models/brend_products_model.dart';

class BrandsController extends GetxController {
  final NetworkService _networkService;
  BrandsModel? _brandsModel;
  BrandProductsModel? _brandsProductsModel;

  BrandsController(this._networkService);

  final _isLoading = false.obs;

  RxBool get isLoading => _isLoading;

  BrandsModel? get brandsModel => _brandsModel;

  BrandProductsModel? get brandsProductsModel => _brandsProductsModel;

  getBrandProductsItem(String brand) async {
    _isLoading.value = true;
    var brandsResponse = await _networkService.getBrands(brand);
    var brandsProductsResponse = await _networkService.getBrandProducts(brand);
    _brandsModel = brandsResponse;
    _brandsProductsModel = brandsProductsResponse;
    _isLoading.value = false;
  }

}
