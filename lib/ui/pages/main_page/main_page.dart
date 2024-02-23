import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/bags_controller.dart';
import 'package:texnomart/data/controllers/main_controller.dart';
import 'package:texnomart/data/utils/app_svg.dart';
import 'package:texnomart/data/utils/localeKeys.dart';
import 'package:texnomart/ui/pages/catalog_page/catalog_page.dart';
import 'package:texnomart/ui/pages/home_page/home_page.dart';
import 'package:texnomart/ui/pages/market_page/market_page.dart';
import 'package:texnomart/ui/pages/profile_page/profile_page.dart';

import '../favorites_page/favorites_page.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  MainController mainController = Get.put(MainController());
  BagsController bagsController = Get.find<BagsController>();

  List<Widget> pages = [
    HomePage(),
    CatalogPage(),
    MarketPage(),
    FavoritePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {

    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: mainController.currentPage.value,
          children: pages,
        ),
        // body: pages[mainController.currentPage.value],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (e) {
            mainController.updatePage(e);
          },
          unselectedItemColor: Colors.grey,
          currentIndex: mainController.currentPage.value,
          fixedColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppSvg.kHome),
              activeIcon: SvgPicture.asset(AppSvg.kAcHome),
              label: LocaleKeys.home.tr,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppSvg.kSearch),
              label: LocaleKeys.search.tr,
              activeIcon: SvgPicture.asset(AppSvg.kAcSearch),
            ),
            BottomNavigationBarItem(
              // icon: SvgPicture.asset(AppSvg.kMarket),
              activeIcon:Obx(() => bagsController.list!.value.length !=0?  badges.Badge(
                position: badges.BadgePosition.topEnd(),
                badgeStyle: const badges.BadgeStyle(
                  padding: EdgeInsets.zero,
                ),
                badgeContent: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow.shade700,
                  ),
                  child: Center(
                    child: Text(
                      bagsController.list!.value.length.toString(),
                      style:
                      const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    ),),
                ),
                child: SvgPicture.asset(AppSvg.kAcMarket),
              ) :SvgPicture.asset(AppSvg.kAcMarket) ,),
              label: LocaleKeys.market.tr,
              icon:Obx(() => bagsController.list?.value.length !=0? badges.Badge(
                position: badges.BadgePosition.topEnd(),
                badgeStyle: const badges.BadgeStyle(
                  padding: EdgeInsets.zero,
                ),
                badgeContent: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow.shade700,
                  ),
                  child: Center(
                    child: Text(
                      bagsController.list!.value.length.toString(),
                      style:
                      const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                child: SvgPicture.asset(AppSvg.kMarket),
              ) : SvgPicture.asset(AppSvg.kMarket),),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppSvg.kFavorite),
              label: LocaleKeys.favorite.tr,
              activeIcon: SvgPicture.asset(AppSvg.kAcFavorite),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppSvg.kProfile),
              activeIcon: SvgPicture.asset(AppSvg.kAcProfile),
              label: LocaleKeys.profile.tr,
            ),
          ],
        ),
      ),
    );
  }
}
