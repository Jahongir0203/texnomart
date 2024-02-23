import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:texnomart/data/models/categories_model.dart';
import 'package:texnomart/data/models/childs_product_model.dart';
import 'package:texnomart/data/models/detail_model.dart';
import 'package:texnomart/data/models/hitProducts_model.dart';
import 'package:texnomart/data/models/newProducts_model.dart';
import 'package:texnomart/data/models/news_model.dart';
import 'package:texnomart/data/models/specialBrends_model.dart';

import '../models/brands_model.dart';
import '../models/brend_products_model.dart';
import '../models/catalog_page_model.dart';
import '../models/collections_model.dart';
import '../models/sliders_model.dart';

part 'network_service.g.dart';

@RestApi(baseUrl: 'https://gateway.texnomart.uz/api/web/v1/')
abstract class NetworkService {
  factory NetworkService(Dio dio, {String baseUrl}) = _NetworkService;

  @GET('content/sliders')
  Future<SlidersModel> getSliders();

  @GET('home/special-brands')
  Future<SpecialBrendsModel> getSpecialBrends();

  @GET('home/special-categories')
  Future<CategoriesModel> getCategories();

  @GET('home/special-products?type=new_products')
  Future<NewProductsModel> getNewProducts();

  @GET('home/special-products?type=hit_products')
  Future<HitProductsModel> getHitProducts();

  @GET('home/collections')
  Future<CollectionsModel> getCollects();

  @GET('content/news')
  Future<NewsModel> getNews();

  @GET('product/detail')
  Future<DetailModel> getDetails(
    @Query('id') int id,
  );

  @GET('header/popup-menu-catalog')
  Future<CatalogPageModel> getCatalogs();

  @GET('brand/categories')
  Future<BrandsModel> getBrands(
    @Query('brand') String brand,
  );

  @GET('brand/products?page=1&limit=10')
  Future<BrandProductsModel> getBrandProducts(
    @Query('brand') String brand,
  );


}
