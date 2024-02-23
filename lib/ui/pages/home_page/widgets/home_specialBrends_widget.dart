import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/homePage_controller.dart';
import 'package:texnomart/data/utils/app_routes.dart';

class HomeSpecialBrends extends StatelessWidget {
  const HomeSpecialBrends({Key? key, required this.homeController})
      : super(key: key);
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: SizedBox(
        height: 55,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: homeController
              .mainPageModel!.specialBrendsModel!.data!.data!.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              children: [
                const SizedBox(
                  height: 2.5,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.brandsPage,
                        arguments: homeController.mainPageModel
                                ?.specialBrendsModel!.data!.data![index].slug ??
                            '');
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                           errorWidget: (context, url, error) => const Icon(Icons.error),
                           progressIndicatorBuilder: (context, url, progress) {
                             return const Center(child: CircularProgressIndicator(),);
                           },
                            imageUrl: homeController
                                    .mainPageModel
                                    ?.specialBrendsModel!
                                    .data!
                                    .data![index]
                                    .image ??
                                ''),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2.5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
