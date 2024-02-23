import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/homePage_controller.dart';
import 'package:texnomart/data/utils/app_routes.dart';

class HomeCategories extends StatelessWidget {
  final HomeController homeController;
  const HomeCategories({Key? key, required this.homeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount:
          homeController.mainPageModel!.categoriesModel!.data!.data!.length ??
              0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.brandsChildPage,arguments: homeController.mainPageModel!.categoriesModel!.data!
                              .data![index].slug ??
                              '' );
                        },
                        splashColor: Colors.yellow.shade200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.network(
                          homeController.mainPageModel!.categoriesModel!.data!
                              .data![index].image ??
                              '',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Center(
                      child: Text(
                        '${homeController.mainPageModel!.categoriesModel!.data!.data![index].title}',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

