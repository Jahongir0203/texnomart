import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/bags_controller.dart';
import 'package:texnomart/data/utils/localeKeys.dart';

import '../../../../data/controllers/detailPage_controller.dart';

class DetailBottomNavigationBar extends StatelessWidget {
  const DetailBottomNavigationBar({
    super.key,
    required this.bagsController,
    required this.detailController,
  });

  final BagsController bagsController;
  final DetailController detailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Obx(
        () => Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: bagsController.iDList.contains(
                      detailController.detailModel.value.data?.data?.id)
                  ? Colors.yellow.shade700
                  : Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
            color: bagsController.iDList
                    .contains(detailController.detailModel.value.data?.data?.id)
                ? Colors.white
                : Colors.yellow.shade700,
          ),
          child: Center(
            child: Text(
              bagsController.iDList
                  .contains(detailController.detailModel.value.data?.data?.id)?  LocaleKeys.atMarket.tr :LocaleKeys.market.tr ,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
