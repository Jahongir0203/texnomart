import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/utils/app_routes.dart';

import '../../../../data/controllers/detailPage_controller.dart';

class DetailData extends StatelessWidget {
  const DetailData({
    super.key,
    required this.detailController,
  });

  final DetailController detailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                detailController.detailModel.value.data?.data?.reviewsCount != null
                    ? Text(
                        'Sharhlar ${detailController.detailModel.value.data?.data?.reviewsCount}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : const Text(
                        "Sharhlar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      const Icon(
                        Icons.star,
                        color: Colors.grey,
                      ),
                    const Icon(Icons.navigate_next, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          InkWell(
            splashColor: Colors.yellow,
            onTap: () {
              Get.toNamed(
                AppRoutes.shopsPage,
                arguments:
                    detailController.detailModel.value.data?.data?.availableStores ??
                        [],
              );
            },
            child: const SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Do'konlarda mavjud",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.navigate_next, color: Colors.grey),
                ],
              ),
            ),
          ),
          const Divider(),
          InkWell(
            splashColor: Colors.yellow,
            onTap: () {
              Get.toNamed(AppRoutes.documentationPage,
                  arguments:
                      detailController.detailModel.value.data?.data?.description ??
                          '');
            },
            child: const SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tarif",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          InkWell(
            splashColor: Colors.yellow,
            onTap: () {
              print(detailController.detailModel.value.data?.data?.characters);
              Get.toNamed(
                AppRoutes.charactericsPage,
                arguments:
                    detailController.detailModel.value.data?.data?.characters ?? [],
              );
            },
            child: const SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Texnik hususiyatlar",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
