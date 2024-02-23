import 'package:get/get.dart';
import 'package:texnomart/data/models/detail_model.dart';
import 'package:texnomart/data/models/favorite_product_model.dart';
import 'package:texnomart/data/services/storage_service.dart';

class BagsController extends GetxController {
  final StorageService _storageService;

  BagsController(this._storageService);

  final _hasProducts = false.obs;
  final _hasFavoriteProducts = false.obs;
  final _hasLikedProducts = false.obs;
  final RxList? _list = [].obs;
  final RxList? _listFavorites = [].obs;
  final RxList? _likedList = [].obs;
  final _iDList = [].obs;

  RxList? get likedList => _likedList;

  RxBool get hasLikedProducts => _hasLikedProducts;

  RxList get iDList => _iDList;

  RxBool get hasProducts => _hasProducts;

  RxBool get hasFavoriteProducts => _hasFavoriteProducts;

  RxList? get list => _list;

  RxList? get listFavorites => _listFavorites;

  saveProducts(DetailModel detailModel) {
    List<DetailModel>? savedProducts = _storageService.getProducts();
    savedProducts?.add(detailModel);
    _storageService.saveProducts(savedProducts);
    getProducts();
  }

  deleteProducts(int id) {
    List<DetailModel>? products = _storageService.getProducts();
    products?.removeWhere((element) => element.data?.data?.id == id);
    _storageService.saveProducts(products);
    getProducts();
  }

  getProducts() {
    List<DetailModel>? products = _storageService.getProducts();
    if (products?.length != 0) {
      _hasProducts.value = true;
      _list?.value = products!;
      _list?.forEach((element) {
        _iDList.add(element.data?.data?.id);
      });
    } else {
      _list?.value = [];
      _hasProducts.value = false;
    }
  }

  saveFavoriteProducts(int id) {
    List<int>? savedFavoriteProducts =
        _storageService.getFavoriteProducts()?.cast<int>();
    savedFavoriteProducts?.add(id);
    _storageService.saveFavoriteProducts(savedFavoriteProducts);
    getFavoriteProducts();
  }

  deleteFavoriteProduct(int id) {
    List<int>? favoriteProducts =
        _storageService.getFavoriteProducts()?.cast<int>();
    favoriteProducts!.remove(id);
    _storageService.saveFavoriteProducts(favoriteProducts);
    getFavoriteProducts();
  }

  getFavoriteProducts() {
    List<int>? favoriteProducts =
        _storageService.getFavoriteProducts()?.cast<int>();
    if (favoriteProducts?.length != 0) {
      _hasFavoriteProducts.value = true;
      _listFavorites?.value = favoriteProducts!;
    } else {
      _listFavorites?.value = [];
      _hasFavoriteProducts.value = false;
    }
  }

  saveLikedProducts(FavoriteProductModel favoriteProductModel) async {
    List<FavoriteProductModel> favoriteProducts =
        await _storageService.getLikedProducts();
    favoriteProducts.add(favoriteProductModel);
    await _storageService.saveLikedProducts(favoriteProducts);
    getLikedProducts();
  }

  getLikedProducts() async {
    List<FavoriteProductModel>? likedProducts =
        _storageService.getLikedProducts();
    if (likedProducts.length != 0) {
      _hasLikedProducts.value = true;
      _likedList?.value = likedProducts;
      // _list?.forEach((element) {
      //   _iDList.add(element.data?.data?.id);
      // });
    } else {
      _likedList?.value = [];
      _hasLikedProducts.value = false;
    }
  }

  deleteLikedProducts(int id) {
    List<FavoriteProductModel>? likedProducts =
        _storageService.getLikedProducts();
    likedProducts.removeWhere((element) => element.id == id);
    _storageService.saveLikedProducts(likedProducts);
    getLikedProducts();
  }

  @override
  void onInit() {
    getProducts();
    getFavoriteProducts();
    getLikedProducts();
    super.onInit();
  }
}
