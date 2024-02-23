import 'package:get/get.dart';

import '../models/mainPage_model.dart';
import '../services/network_service.dart';

class HomeController extends GetxController {
  final NetworkService _networkService;

  HomeController(this._networkService);

  late MainPageModel? _mainPageModel;
  final _isLoading = false.obs;
  final _index = 0.obs;
  final _collectionsIndex=0.obs;
  RxInt get collectionsIndex=>_collectionsIndex;

  RxInt get index => _index;

  RxBool get isLoading => _isLoading;

  MainPageModel? get mainPageModel => _mainPageModel;

  getCollectionIndex(int index){
    _collectionsIndex.value=index;
  }


  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getCurrentPosition(int index) {
    _index.value = index;
  }

  getData() async {
    _isLoading.value = true;
    var slidersResponse = await _networkService.getSliders();
    var categoriesResponse = await _networkService.getCategories();
    var collectionsResponse = await _networkService.getCollects();
    var hitProductsResponse = await _networkService.getHitProducts();
    var newsProductsResponse = await _networkService.getNewProducts();
    var newsResponse = await _networkService.getNews();
    var specialBrendsResponse = await _networkService.getSpecialBrends();

    _mainPageModel = MainPageModel(
      slidersResponse,
      categoriesResponse,
      collectionsResponse,
      hitProductsResponse,
      newsProductsResponse,
      newsResponse,
      specialBrendsResponse,
    );
    _isLoading.value = false;
  }
}
