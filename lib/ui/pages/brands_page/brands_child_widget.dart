import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/product_items_controller.dart';
import 'package:texnomart/data/services/network_service_demo.dart';
import 'package:texnomart/data/utils/app_routes.dart';
import 'package:texnomart/data/utils/app_svg.dart';

class BrandsChildPage extends StatelessWidget {
  BrandsChildPage({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    print(text);
    ProductItemsController controller =
        Get.put(ProductItemsController(NetworkServiceDemo(Dio())))
          ..getChildsProduct(text);
    return Obx(

            () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow.shade700,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: Text(text.toUpperCase()),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(5),
                        splashColor: Colors.yellow.shade300,
                        onTap: () {},
                        child: const Row(
                          children: [
                            Icon(Icons.swap_vert_outlined),
                            Text("Ommabopligi"),
                          ],
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(5),
                        splashColor: Colors.yellow.shade300,
                        onTap: () {},
                        child: const Row(
                          children: [
                            Icon(Icons.display_settings),
                            Text("Filtr"),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.line_weight),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                          ),
                          child: SingleChildScrollView(
                            child: GridView.builder(
                              itemCount: controller.childsProductModel.value
                                      .data?.products?.length ??
                                  0,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.5,
                                crossAxisCount: 2,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  splashColor: Colors.yellow,
                                  onTap: () {
                                    Get.toNamed(AppRoutes.detailPage,
                                        arguments: controller
                                                .childsProductModel
                                                .value
                                                .data
                                                ?.products?[index]
                                                .id ??
                                            0);
                                  },
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 15,
                                        bottom: 8,
                                        right: 8,
                                        left: 8,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: CachedNetworkImage(
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                              imageUrl: controller
                                                      .childsProductModel
                                                      .value
                                                      .data
                                                      ?.products?[index]
                                                      .image ??
                                                  '',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2, vertical: 5),
                                            child: Text(
                                              controller
                                                      .childsProductModel
                                                      .value
                                                      .data
                                                      ?.products?[index]
                                                      .name ??
                                                  '',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 3, bottom: 3),
                                            child: Row(
                                              children: [
                                                for (int i = 0; i < 5; i++)
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.grey,
                                                    size: 20,
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 25,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.grey.shade300,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 3),
                                              child: Text(
                                                controller
                                                        .childsProductModel
                                                        .value
                                                        .data
                                                        ?.products?[index]
                                                        .axiomMonthlyPrice ??
                                                    ''.split('с').first,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  controller
                                                          .childsProductModel
                                                          .value
                                                          .data
                                                          ?.products?[index]
                                                          .fSalePrice ??
                                                      '',
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                      color: Colors
                                                          .yellow.shade700,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: SvgPicture.asset(
                                                        AppSvg.kAcMarket),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ));
  }
}
