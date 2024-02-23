import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/homePage_controller.dart';

class HomeDotIndicators extends StatelessWidget {
  const HomeDotIndicators({Key? key, required this.homeController}) : super(key: key);
final HomeController homeController;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: const EdgeInsets.only(
        top:5,
      ),
      child: SizedBox(
        height: 20,
        child: Center(
          child: DotsIndicator(
            dotsCount:
            homeController.mainPageModel!.slidersModel!.data!.data!.length,
            position: homeController.index.value,
            decorator: const DotsDecorator(
              color: Colors.grey, // Inactive color
              activeColor: Colors.black,
            ),
          ),
        ),
      ),
    ));
  }
}
