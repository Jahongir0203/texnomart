import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/bags_controller.dart';
import 'package:texnomart/data/controllers/cities_controller.dart';
import 'package:texnomart/data/controllers/locale_controller.dart';
import 'package:texnomart/data/controllers/main_controller.dart';
import 'package:texnomart/data/controllers/user_controller.dart';
import 'package:texnomart/data/utils/app_routes.dart';
import 'package:texnomart/data/utils/localeKeys.dart';

import '../../../data/services/firebase_service.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  MainController mainController = Get.find<MainController>();
  CitiesController citiesController = Get.find<CitiesController>();
  LocaleController localeController = Get.find<LocaleController>();
  BagsController bagsController = Get.find<BagsController>();
  UserController userController = Get.put(UserController(FirebaseService()));
  @override
  Widget build(BuildContext context) {

    print(FirebaseAuth.instance.currentUser?.email.toString());
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.yellow.shade700,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => userController.user.value?.email != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.person),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                                FirebaseAuth.instance.currentUser?.email ?? ''),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.navigate_next_outlined,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text(
                                  LocaleKeys.buy.tr,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.yellow.shade700,
                                  ),
                                  child: MaterialButton(
                                    splashColor: Colors.yellow,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    onPressed: () {
                                      Get.toNamed(AppRoutes.logInPage);
                                    },
                                    child: Center(
                                      child: Text(LocaleKeys.logIn.tr),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                    child: Column(
                      children: [
                        ProfileRows(
                          onTap: () {},
                          text: "Aksiya",
                          iconData: Icons.percent_rounded,
                        ),
                        Obx(
                          () => ProfileRows(
                              onTap: () {
                                print('23');
                                mainController.updatePage(3);
                              },
                              text: "Sevimlilar",
                              iconData: Icons.favorite_border,
                              text2: bagsController.listFavorites?.length
                                  .toString()),
                        ),
                        ProfileRows(
                          onTap: () {},
                          text: "Taqqoslash",
                          iconData: Icons.scale,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                    child: Column(
                      children: [
                        Obx(
                          () => ProfileRows(
                              onTap: () {
                                Get.toNamed(AppRoutes.citiesPage);
                              },
                              text: "Shahar",
                              iconData: Icons.location_on_sharp,
                              text2: citiesController.city.value),
                        ),
                        ProfileRows(
                          onTap: () {
                            Get.toNamed(AppRoutes.languagePage);
                          },
                          text: "Ilova tili",
                          iconData: Icons.language,
                          text2: localeController.locale.value?.countryCode,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                    child: Column(
                      children: [
                        ProfileRows(
                          onTap: () {},
                          text: "Bizning do'konlarimiz",
                          iconData: Icons.business_sharp,
                        ),
                        ProfileRows(
                          onTap: () {},
                          text: "Ma'lumot",
                          iconData: Icons.error_outline_rounded,
                        ),
                        ProfileRows(
                          onTap: () {},
                          text: "Qo'llab-quvvatlash xizmati ",
                          iconData: Icons.contact_support,
                        ),
                        Obx(
                          () => userController.user.value?.email != null
                              ? ProfileRows(
                                  onTap: () {
                                    userController.signOutUser();
                                  },
                                  text: "Chiqish ",
                                  iconData: Icons.logout,
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class ProfileRows extends StatelessWidget {
  const ProfileRows({
    super.key,
    required this.iconData,
    required this.text,
    required this.onTap,
    this.text2,
  });

  final IconData iconData;
  final String text;
  final Function onTap;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      splashColor: Colors.yellow,
      onPressed: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(iconData),
                const SizedBox(
                  width: 10,
                ),
                Text(text),
              ],
            ),
            Row(
              children: [
                text2 != null
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          child: Text(text2.toString()),
                        ),
                      )
                    : SizedBox(),
                const Icon(
                  Icons.navigate_next,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
