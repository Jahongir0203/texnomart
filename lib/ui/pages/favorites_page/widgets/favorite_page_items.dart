import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/controllers/detailPage_controller.dart';

class FavoritePageItems extends StatelessWidget {
  FavoritePageItems({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    print(id);
    DetailController detailController = Get.find<DetailController>()
      ..getDetails(id);

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 30, left: 5, right: 10, top: 5),
            child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorWidget: (context, url, error) {
                  return Icon(Icons.error);
                },
                imageUrl: detailController
                        .detailModel.value.data?.data?.smallImages?[0] ??
                    ''),
          ),
        ),
        Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detailController.detailModel.value.data?.data?.name ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    for (int i = 0; i <= 5; i++)
                      const Icon(
                        Icons.star,
                        color: Colors.grey,
                      ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    child: Text(
                      detailController
                              .detailModel.value.data?.data?.monthlyPrice ??
                          '',
                    ),
                  ),
                ),
                Text(
                  detailController.detailModel.value.data?.data?.salePrice
                          .toString() ??
                      '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
