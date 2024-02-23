import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/controllers/detailPage_controller.dart';

class DetailDotIndicators extends StatelessWidget {
  const DetailDotIndicators({
    super.key,
    required this.detailController,
  });

  final DetailController detailController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: DotsIndicator(
        dotsCount: detailController
            .detailModel.value.data?.data?.smallImages?.length ??
            0,
        axis: Axis.horizontal,
        decorator: const DotsDecorator(
          color: Colors.grey,
          activeColor: Colors.black,

        ),
        position: detailController.currentIndex.value,
      ),
    ),);
  }
}