import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/bags_controller.dart';
import 'package:texnomart/data/models/favorite_product_model.dart';
import 'package:texnomart/data/utils/app_routes.dart';

import '../../../../data/controllers/homePage_controller.dart';
import '../../../../data/utils/app_svg.dart';
import '../../../../data/utils/localeKeys.dart';

class HomeHitProducts extends StatelessWidget {
  HomeHitProducts({
    Key? key,
    required this.homeController,
  }) : super(key: key);
  final HomeController homeController;
  BagsController bagsController = Get.find<BagsController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: homeController
                .mainPageModel!.hitProductsModel!.data!.data?.length ??
            0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8),
            child: InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.detailPage,
                    arguments: homeController.mainPageModel!.hitProductsModel!
                        .data!.data![index].id);
              },
              child: SizedBox(
                width: 130,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 150,
                            child: Image.network(
                              homeController.mainPageModel!.hitProductsModel!
                                      .data!.data![index].image ??
                                  '',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 1,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Obx(() => IconButton(
                                          onPressed: () {
                                            if (bagsController.listFavorites!
                                                    .contains(homeController
                                                        .mainPageModel!
                                                        .hitProductsModel!
                                                        .data!
                                                        .data![index]
                                                        .id) &&
                                                bagsController.listFavorites
                                                        ?.length !=
                                                    0) {
                                              bagsController
                                                  .deleteLikedProducts(
                                                      homeController
                                                              .mainPageModel!
                                                              .hitProductsModel!
                                                              .data!
                                                              .data![index]
                                                              .id ??
                                                          0);
                                              bagsController
                                                  .deleteFavoriteProduct(
                                                      homeController
                                                              .mainPageModel!
                                                              .hitProductsModel!
                                                              .data!
                                                              .data![index]
                                                              .id ??
                                                          0);
                                            } else {
                                              bagsController.saveLikedProducts(
                                                FavoriteProductModel(
                                                  name: homeController
                                                          .mainPageModel!
                                                          .hitProductsModel!
                                                          .data!
                                                          .data![index]
                                                          .name ??
                                                      '',
                                                  id: homeController
                                                          .mainPageModel!
                                                          .hitProductsModel!
                                                          .data!
                                                          .data![index]
                                                          .id ??
                                                      0,
                                                  imageUrl: homeController
                                                          .mainPageModel!
                                                          .hitProductsModel!
                                                          .data!
                                                          .data![index]
                                                          .image ??
                                                      '',
                                                  monthlyPrice: homeController
                                                          .mainPageModel!
                                                          .hitProductsModel!
                                                          .data!
                                                          .data![index]
                                                          .axiomMonthlyPrice ??
                                                      '',
                                                  salePrice: homeController
                                                          .mainPageModel!
                                                          .hitProductsModel!
                                                          .data!
                                                          .data![index]
                                                          .salePrice ??
                                                      0,
                                                ),
                                              );
                                              bagsController
                                                  .saveFavoriteProducts(
                                                      homeController
                                                              .mainPageModel!
                                                              .hitProductsModel!
                                                              .data!
                                                              .data![index]
                                                              .id ??
                                                          0);
                                            }
                                          },
                                          icon: bagsController.listFavorites!
                                                  .contains(homeController
                                                      .mainPageModel!
                                                      .hitProductsModel!
                                                      .data!
                                                      .data![index]
                                                      .id)
                                              ? SvgPicture.asset(AppSvg.kLiked)
                                              : SvgPicture.asset(
                                                  AppSvg.kUnLiked),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 1,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(AppSvg.kCompare),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                        ),
                        child: Text(
                          homeController.mainPageModel!.hitProductsModel!.data!
                                  .data![index].name ??
                              '',
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < 5; i++)
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 14,
                              ),
                            ),
                        ],
                      ),
                      Container(
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          child: Row(
                            children: [
                              Text(
                                homeController.mainPageModel!.hitProductsModel!
                                        .data!.data![index].axiomMonthlyPrice!
                                        .split('s')
                                        .first ??
                                    '',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                LocaleKeys.month.tr,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Text(
                              homeController.mainPageModel!.hitProductsModel!
                                      .data!.data![index].salePrice
                                      .toString() ??
                                  '',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              LocaleKeys.month.tr.split('/').first,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
