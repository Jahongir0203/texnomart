import 'dart:ui';

import 'package:get_storage/get_storage.dart';
import 'package:texnomart/data/models/detail_model.dart';

import '../models/favorite_product_model.dart';

class StorageService {
  var _storage = GetStorage();
  String _localeKey = 'locale';
  String _savedProducts = 'savedProducts';
  String _favoriteProducts = 'favoriteProducts';
  String _likedProducts = 'likedProducts';

  saveLikedProducts(List<FavoriteProductModel>? list) {
    final List<Map<String, dynamic>>? likedProducts =
        list?.map((e) => e.toJson()).toList();
    _storage.write(_likedProducts, likedProducts);
  }

  List<FavoriteProductModel> getLikedProducts() {
    final List<dynamic>? likedProducts =
        _storage.read<List<dynamic>>(_likedProducts);

    if(likedProducts !=null){
      List<FavoriteProductModel>? list = likedProducts.map((e) => FavoriteProductModel.fromJson(e)).toList();
      return list;
    }else{
      return [];
    }

  }

  saveFavoriteProducts(List<int>? ids) {
    _storage.write(_favoriteProducts, ids);
  }

  List<dynamic>? getFavoriteProducts() {
    final List<dynamic>? idsList =
        _storage.read<List<dynamic>>(_favoriteProducts);
    if (idsList != null) {
      return idsList;
    } else {
      return [];
    }
  }

  saveProducts(List<DetailModel>? detailModel) {
    final List<Map<String, dynamic>>? detailModelMaps =
        detailModel?.map((e) => e.toJson()).toList();
    _storage.write(_savedProducts, detailModelMaps);
  }

  List<DetailModel>? getProducts() {
    final List<dynamic>? detailModelMaps =
        _storage.read<List<dynamic>>(_savedProducts);
    if (detailModelMaps != null) {
      final List<DetailModel> detailModels =
          detailModelMaps.map((e) => DetailModel.fromJson(e)).toList();
      return detailModels;
    } else {
      return [];
    }
  } 

  saveLocale(Locale locale) {
    _storage.write(_localeKey, '${locale.languageCode}_${locale.countryCode}');
  }

  Locale? getLocale() {
    String? locale = _storage.read(_localeKey);
    if (locale != null) {
      return Locale(
        locale.split('_')[0],
        locale.split('_')[1],
      );
    } else {
      return null;
    }
  }
}
