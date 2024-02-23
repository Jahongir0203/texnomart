import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../data/controllers/main_controller.dart';
import '../../../../data/utils/app_svg.dart';
import '../../../../data/utils/localeKeys.dart';

class NothingInBag extends StatelessWidget {
  const NothingInBag({
    super.key,
    required this.mainController,
  });

  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppSvg.kMarket,height: 60,width: 60,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(LocaleKeys.nothing.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            InkWell(
              onTap: (){
                mainController.updatePage(1);
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.yellow.shade700,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    LocaleKeys.seeProducts.tr,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
