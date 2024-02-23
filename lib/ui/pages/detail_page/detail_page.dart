import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/bags_controller.dart';
import 'package:texnomart/data/controllers/detailPage_controller.dart';
import 'package:texnomart/data/models/favorite_product_model.dart';
import 'package:texnomart/data/services/network_service.dart';
import 'package:texnomart/ui/pages/detail_page/widgets/detail_bottom_widget.dart';
import 'package:texnomart/ui/pages/detail_page/widgets/detail_carusel_widget.dart';
import 'package:texnomart/ui/pages/detail_page/widgets/detail_costs_widget.dart';
import 'package:texnomart/ui/pages/detail_page/widgets/detail_data.dart';
import 'package:texnomart/ui/pages/detail_page/widgets/detail_dot_indicators_widget.dart';
import 'package:texnomart/ui/pages/detail_page/widgets/detail_have_widget.dart';
import 'package:texnomart/ui/pages/detail_page/widgets/detail_main_character_widget.dart';
import 'package:texnomart/ui/pages/detail_page/widgets/detail_month_price.dart';

import '../../../data/utils/app_svg.dart';
import 'widgets/detail_name_widget.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.id}) : super(key: key);
  final int id;
  BagsController bagsController = Get.find<BagsController>();

  @override
  Widget build(BuildContext context) {
    DetailController detailController =
        Get.put(DetailController(NetworkService(Dio())))..getDetails(id);

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade700,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.file_upload_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppSvg.kCompare,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (bagsController.listFavorites!.isNotEmpty &&
                        bagsController.listFavorites!.contains(
                            detailController.detailModel.value.data?.data?.id ??
                                0)) {
                      bagsController.deleteLikedProducts(
                          detailController.detailModel.value.data?.data?.id ??
                              0);
                      bagsController.deleteFavoriteProduct(
                          detailController.detailModel.value.data?.data?.id ??
                              0);
                    } else {
                      bagsController.saveLikedProducts(FavoriteProductModel(
                        id: detailController.detailModel.value.data?.data?.id ??
                            0,
                        salePrice: detailController
                                .detailModel.value.data?.data?.salePrice ??
                            0,
                        monthlyPrice: detailController
                                .detailModel.value.data?.data?.monthlyPrice ??
                            '',
                        imageUrl: detailController
                                .detailModel.value.data?.data?.smallImages?[0] ??
                            '',
                        name: detailController
                                .detailModel.value.data?.data?.name ??
                            '',
                      ));
                      bagsController.saveFavoriteProducts(
                          detailController.detailModel.value.data?.data?.id ??
                              0);
                    }
                  },
                  icon: bagsController.listFavorites!.contains(
                          detailController.detailModel.value.data?.data?.id ??
                              0)
                      ? SvgPicture.asset(AppSvg.kLiked)
                      : SvgPicture.asset(AppSvg.kUnLiked),
                ),
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: detailController.isLoading.value
              ? SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      DetailCarouselSliders(detailController: detailController),
                      DetailDotIndicators(detailController: detailController),
                      DetailHave(detailController: detailController),
                      DetailName(detailController: detailController),
                      DetailCosts(detailController: detailController),
                      DetailMonthlyPrice(detailController: detailController),
                      DetailData(detailController: detailController),
                      DetailMainCharacters(detailController: detailController),
                    ],
                  ),
                ),
        ),
        bottomNavigationBar: bagsController.iDList
                .contains(detailController.detailModel.value.data?.data?.id)
            ? DetailBottomNavigationBar(
                bagsController: bagsController,
                detailController: detailController)
            : InkWell(
                onTap: () {
                  print(bagsController.iDList);
                  print(bagsController.iDList.contains(
                      detailController.detailModel.value.data?.data?.id));
                  bagsController.saveProducts(
                    detailController.detailModel.value,
                  );
                },
                child: DetailBottomNavigationBar(
                  bagsController: bagsController,
                  detailController: detailController,
                ),
              ),
      ),
    );
  }
}
