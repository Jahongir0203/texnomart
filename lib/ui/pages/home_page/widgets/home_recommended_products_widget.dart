import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/utils/app_routes.dart';

import '../../../../data/controllers/bags_controller.dart';
import '../../../../data/controllers/homePage_controller.dart';
import '../../../../data/models/favorite_product_model.dart';
import '../../../../data/utils/app_svg.dart';
import '../../../../data/utils/localeKeys.dart';

class HomeRecommendedProductions extends StatelessWidget {
  const HomeRecommendedProductions({Key? key, required this.homeController, required this.bagsController}) : super(key: key);
 final HomeController homeController;
 final BagsController bagsController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: homeController
            .mainPageModel!
            .collectionsModel!
            .data!
            .data![1]
            .products!
            .length ??
            0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8),
            child: InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.detailPage,arguments: homeController.mainPageModel?.collectionsModel
                    ?.data?.data?[1].products?[index].id ?? 0);
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
                              homeController
                                  .mainPageModel!
                                  .collectionsModel!
                                  .data!
                                  .data![1]
                                  .products![index]
                                  .image ??
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
                                        if (bagsController
                                            .listFavorites!.value
                                            .contains(homeController
                                            .mainPageModel!
                                            .collectionsModel!
                                            .data!
                                            .data![1]
                                            .products![index]
                                            .id ?? 0)) {
                                          bagsController
                                              .deleteLikedProducts(
                                              homeController
                                                  .mainPageModel!
                                                  .collectionsModel!
                                                  .data!
                                                  .data![1]
                                                  .products![index]
                                                  .id ??
                                                  0);
                                          bagsController
                                              .deleteFavoriteProduct(
                                              homeController
                                                  .mainPageModel!
                                                  .collectionsModel!
                                                  .data!
                                                  .data![1]
                                                  .products![index]
                                                  .id ?? 0);
                                        } else {
                                          bagsController.saveLikedProducts(
                                              FavoriteProductModel(
                                                id: homeController
                                                    .mainPageModel!
                                                    .collectionsModel!
                                                    .data!
                                                    .data![1]
                                                    .products![index]
                                                    .id ??
                                                    0,
                                                salePrice: homeController
                                                    .mainPageModel!
                                                    .collectionsModel!
                                                    .data!
                                                    .data![1]
                                                    .products![index]
                                                    .salePrice ??
                                                    0,
                                                monthlyPrice: homeController
                                                    .mainPageModel!
                                                    .collectionsModel!
                                                    .data!
                                                    .data![1]
                                                    .products![index]
                                                    .axiomMonthlyPrice ??
                                                    '',
                                                imageUrl: homeController
                                                    .mainPageModel!
                                                    .collectionsModel!
                                                    .data!
                                                    .data![1]
                                                    .products![index]
                                                    .image ??
                                                    '',
                                                name: homeController
                                                    .mainPageModel!
                                                    .collectionsModel!
                                                    .data!
                                                    .data![1]
                                                    .products![index]
                                                    .name ??
                                                    '',
                                              ));
                                          bagsController
                                              .saveFavoriteProducts(
                                              homeController
                                                  .mainPageModel!
                                                  .collectionsModel!
                                                  .data!
                                                  .data![1]
                                                  .products![index]
                                                  .id ?? 0);
                                        }
                                      },
                                      icon: bagsController
                                          .listFavorites!.value
                                          .contains(homeController
                                          .mainPageModel!
                                          .collectionsModel!
                                          .data!
                                          .data![1]
                                          .products![index]
                                          .id ?? 0)
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
                          homeController
                              .mainPageModel!
                              .collectionsModel!
                              .data!
                              .data![1]
                              .products![index]
                              .name ??
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
                                homeController
                                    .mainPageModel!
                                    .collectionsModel!
                                    .data!
                                    .data![1]
                                    .products![index]
                                    .axiomMonthlyPrice!
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
                              homeController
                                  .mainPageModel!
                                  .collectionsModel!
                                  .data!
                                  .data![1]
                                  .products![index]
                                  .salePrice
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

