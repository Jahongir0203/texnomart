import 'package:get/get.dart';

class CitiesController extends GetxController{
  final RxString _city='Toshkent'.obs;

  RxString get city=>_city;

  getCity(String city){
    _city.value=city;
  }


}