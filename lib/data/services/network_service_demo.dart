import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/childs_product_model.dart';

part 'network_service_demo.g.dart';

@RestApi(baseUrl: 'https://gateway.texnomart.uz/api/common/v1/')
abstract class NetworkServiceDemo {
  factory NetworkServiceDemo(Dio dio, {String baseUrl}) = _NetworkServiceDemo;

  @GET('search/filters?sort=price&page=1&')
  Future<ChildsProductModel> getChildsProduct(
    @Query('category') String category,
  );
}
