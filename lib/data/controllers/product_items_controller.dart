import 'package:get/get.dart';
import 'package:texnomart/data/models/childs_product_model.dart';
import 'package:texnomart/data/services/network_service_demo.dart';

class ProductItemsController extends GetxController {
  final NetworkServiceDemo _networkService;

  ProductItemsController(this._networkService);

  final _isLoading = false.obs;

  RxBool get isLoading => _isLoading;

  Rx<ChildsProductModel> childsProductModel=ChildsProductModel().obs;


  Future<void> getChildsProduct(String category) async {
    _isLoading.value = true;
    var childsResponse = await _networkService.getChildsProduct(category);
    childsProductModel.value = childsResponse;
    _isLoading.value = false;
  }

}
