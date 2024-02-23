import 'package:get/get.dart';
import 'package:texnomart/data/models/detail_model.dart';

import '../services/network_service.dart';

class DetailController extends GetxController {
  final NetworkService _networkService;

  DetailController(this._networkService,);

   Rx<DetailModel> detailModel =DetailModel().obs;
  final _isLoading = false.obs;
  final _currentIndex = 0.obs;

  RxBool get isLoading => _isLoading;

  RxInt get currentIndex => _currentIndex;

  getCurrentIndex(int index) {
    _currentIndex.value = index;
  }

   getDetails(int id) async {
    _isLoading.value = true;
    DetailModel response = await _networkService.getDetails(id);
    detailModel.value = response;
    _isLoading.value = false;
  }

}
