import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/bags_controller.dart';
import 'package:texnomart/data/controllers/detailPage_controller.dart';
import 'package:texnomart/data/utils/app_routes.dart';
import 'package:texnomart/data/utils/localeKeys.dart';
import 'package:texnomart/ui/pages/favorites_page/widgets/nothing_in_favorites_widgets.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);
  BagsController bagsController = Get.find<BagsController>()
    ..getLikedProducts();
  DetailController detailController = Get.find<DetailController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade700,
          title: Text(LocaleKeys.favorite.tr),
        ),
        body: bagsController.hasFavoriteProducts.value
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: ListView.separated(

                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: bagsController.likedList?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        splashColor: Colors.yellow,
                        onTap: (){
                          Get.toNamed(AppRoutes.detailPage,arguments: bagsController.likedList?[index]
                              .id ?? 0);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 40, left: 5, right: 15, top: 8),
                                child: CachedNetworkImage(
                                    progressIndicatorBuilder:
                                        (context, url, progress) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                    errorWidget: (context, url, error) {
                                      return Icon(Icons.error);
                                    },
                                    imageUrl: bagsController
                                            .likedList?[index].imageUrl ??
                                        ''),
                              ),
                            ),
                            Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        bagsController.likedList?[index].name ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            for (int i = 0; i <= 5; i++)
                                              const Icon(
                                                Icons.star,
                                                color: Colors.grey,
                                              ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 3),
                                          child: Text(
                                            bagsController.likedList?[index]
                                                    .monthlyPrice ??
                                                '',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15,),
                                      Row(
                                        children: [
                                          Text(
                                            bagsController.likedList?[index].salePrice
                                                    .toString() ??
                                                '',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(" So'm",style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      bagsController.deleteFavoriteProduct(
                                          bagsController.likedList?[index].id);
                                      bagsController.deleteLikedProducts(
                                          bagsController.likedList?[index].id);
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                  },
                  ),
                ),
              )
            : const NothingInFavorites(),
      ),
    );
  }
}
