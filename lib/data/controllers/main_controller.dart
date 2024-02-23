import 'package:get/get.dart';

class MainController extends GetxController {
  final _currentPage = 0.obs;

  RxInt get currentPage => _currentPage;

  updatePage(int index) {
    this._currentPage.value = index;
  }
}
