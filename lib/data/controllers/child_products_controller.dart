import 'package:get/get.dart';
import 'package:texnomart/data/models/childs_product_model.dart';
import 'package:texnomart/data/services/network_service_demo.dart';

class ChildsProductController extends GetxController {
  final NetworkServiceDemo _networkService;

  ChildsProductController(this._networkService);

  final _isLoading = false.obs;
  final _itemIndex = 100.obs;

  RxBool get isLoading => _isLoading;

  RxInt get itemIndex => _itemIndex;
  Rx<ChildsProductModel> childsProductModel=ChildsProductModel().obs;

  getItemIndex(int index) {
    _itemIndex.value = index;
  }

  Future<void> getChildsProduct(String category) async {
    _isLoading.value = true;
    var childsResponse = await _networkService.getChildsProduct(category);
    print(childsResponse.data?.products.toString());
    childsProductModel.value = childsResponse;
    _isLoading.value = false;
  }

  @override
  void dispose() {
    print("Dispose");
    _isLoading.value=false;
    childsProductModel.value=ChildsProductModel();
    super.dispose();


  }
}
