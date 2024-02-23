import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/brands_page_controller.dart';
import 'package:texnomart/data/services/network_service.dart';
import 'package:texnomart/data/services/network_service_demo.dart';

import '../../../data/controllers/child_products_controller.dart';
import '../../../data/utils/app_routes.dart';
import '../../../data/utils/app_svg.dart';
import 'package:dio/dio.dart';
class BrandsPage extends StatelessWidget {
  BrandsPage({Key? key, required this.brand}) : super(key: key);
  final String brand;

  @override
  Widget build(BuildContext context) {

    return GetBuilder(
      init: ChildsProductController(NetworkServiceDemo(Dio()))..getChildsProduct(brand ?? ''),
      builder:  (controller) {
        BrandsController brandsController = Get.put(BrandsController(NetworkService(Dio())))..getBrandProductsItem(brand);
        return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade700,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(brand.toUpperCase()),
        ),
        body: Obx(() => SingleChildScrollView(
          child: brandsController.isLoading.value &&
              controller.isLoading.value
              ? Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
              : Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: brandsController
                      .brandsModel?.data?.data?.length ??
                      0,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8,
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: MaterialButton(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10)),
                                splashColor: Colors.yellow,
                                onPressed: () {
                                  print(brandsController.brandsModel
                                      ?.data?.data?[index].slug ?? '');
                                  Get.toNamed(AppRoutes.brandsChildPage,arguments:brandsController.brandsModel
                                      ?.data?.data?[index].slug ?? '');
                                },
                                child: CachedNetworkImage(
                                  errorWidget: (context, url, error) {
                                    return const Icon(Icons.error);
                                  },
                                  imageUrl: brandsController.brandsModel
                                      ?.data?.data?[index].image ??
                                      '',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                brandsController.brandsModel?.data
                                    ?.data?[index].name ??
                                    '',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                controller
                    .childsProductModel.value.data?.products?.length != 0 ?  Text("${brand.toUpperCase()} mahsulotlari",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),) : Container(),
                GridView.builder(
                  itemCount: controller
                      .childsProductModel.value.data?.products?.length ??
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
                                .childsProductModel.value
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
                                height:
                                MediaQuery.of(context).size.height /
                                    5,
                                child: CachedNetworkImage(
                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                                  imageUrl: controller
                                      .childsProductModel.value
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
                                      .childsProductModel.value.data
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 3),
                                  child: Text(
                                    controller
                                        .childsProductModel.value.data
                                        ?.products?[index]
                                        .axiomMonthlyPrice ??
                                        ''.split('с').first,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller
                                          .childsProductModel.value.data
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
                                        BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Colors.yellow.shade700,
                                          width: 2,
                                        ),
                                      ),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.all(5.0),
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
              ],
            ),
          ),
        )),
      );
    },);
  }
}
