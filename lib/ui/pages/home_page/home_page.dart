import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/bags_controller.dart';
import 'package:texnomart/data/controllers/main_controller.dart';
import 'package:texnomart/data/utils/localeKeys.dart';
import 'package:texnomart/ui/pages/home_page/widgets/build_textField.dart';
import 'package:texnomart/ui/pages/home_page/widgets/home_categories_widget.dart';
import 'package:texnomart/ui/pages/home_page/widgets/home_divider_widget.dart';
import 'package:texnomart/ui/pages/home_page/widgets/home_dotsIndicator_widget.dart';
import 'package:texnomart/ui/pages/home_page/widgets/home_hitProducts_widget.dart';
import 'package:texnomart/ui/pages/home_page/widgets/home_mazzaNarx_widget.dart';
import 'package:texnomart/ui/pages/home_page/widgets/home_namedTitle_widget.dart';
import 'package:texnomart/ui/pages/home_page/widgets/home_newProducts_widget.dart';
import 'package:texnomart/ui/pages/home_page/widgets/home_news_blogs_widget.dart';
import 'package:texnomart/ui/pages/home_page/widgets/home_recommended_products_widget.dart';
import 'package:texnomart/ui/pages/home_page/widgets/home_sliders_widget.dart';
import 'package:texnomart/ui/pages/home_page/widgets/home_specialBrends_widget.dart';
import 'package:texnomart/ui/pages/home_page/widgets/home_texnomart_widget.dart';

import '../../../data/controllers/homePage_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  HomeController homeController = Get.find<HomeController>();
  MainController mainController = Get.find<MainController>();
  CarouselController buttonCarouselController = CarouselController();
  BagsController bagsController = Get.find<BagsController>();

  @override
  Widget build(BuildContext context) {
    print(LocaleKeys.month.tr);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        toolbarHeight: 0,
      ),
      body: Obx(
        () => SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const HomeTexnomart(),
              const HomeTextField(),
              CupertinoSliverRefreshControl(
                onRefresh: () async {
                  await homeController.getData();
                },
              ),
              homeController.isLoading.value
                  ? const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          HomeSliders(homeController: homeController),
                          HomeDotIndicators(homeController: homeController),
                          HomeSpecialBrends(homeController: homeController),
                          HomeNamedTitles(
                            name: LocaleKeys.categories,
                            onTap: () {
                              mainController.updatePage(1);
                            },
                            isDone: true,
                          ),
                          HomeCategories(homeController: homeController),
                          const HomeDivider(),
                          HomeNamedTitles(
                            name: LocaleKeys.hitProducts,
                            onTap: () {},
                            isDone: false,
                          ),
                          HomeHitProducts(homeController: homeController),
                          const HomeDivider(),
                          HomeNamedTitles(
                            name: LocaleKeys.collections,
                            onTap: () {},
                            isDone: false,
                          ),
                          HomeMazzaNarx(
                            homeController: homeController,
                            bagsController: bagsController,
                          ),
                          const HomeDivider(),
                          HomeNamedTitles(
                            name: LocaleKeys.recommend,
                            onTap: () {},
                            isDone: false,
                          ),
                          HomeRecommendedProductions(
                            homeController: homeController,
                            bagsController: bagsController,
                          ),
                          const HomeDivider(),
                          homeController.mainPageModel!.newProductsModel!.data!
                                  .data!.isNotEmpty
                              ? HomeNamedTitles(
                                  name: LocaleKeys.newProducts,
                                  onTap: () {},
                                  isDone: false,
                                )
                              : const SizedBox(),
                          homeController.mainPageModel!.newProductsModel!.data!
                                  .data!.isNotEmpty
                              ? HomeNewProducts(
                                  homeController: homeController,
                                  bagsController: bagsController,
                                )
                              : const SizedBox(),
                          homeController.mainPageModel!.newProductsModel!.data!
                                  .data!.isNotEmpty
                              ? const HomeDivider()
                              : const SizedBox(),
                          HomeNamedTitles(
                            name: LocaleKeys.newsVsBlogs,
                            onTap: () {},
                            isDone: false,
                          ),
                          HomeNewsVsBlogs(homeController: homeController),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
