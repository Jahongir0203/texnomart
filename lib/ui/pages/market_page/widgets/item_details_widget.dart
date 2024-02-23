import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../data/controllers/bags_controller.dart';

class ItemDetails extends StatelessWidget {
  ItemDetails({Key? key, required this.bagsController, required this.index}) : super(key: key);
  final BagsController bagsController;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 15),
              child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) {
                  return LoadingAnimationWidget.twoRotatingArc(
                    color: Colors.yellow,
                    size: 20,
                  );
                },
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl:
                bagsController.list?[index].data?.data?.smallImages?[0] ??
                    '',
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      bagsController.list?[index].data?.data?.name ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          bagsController.list?[index].data?.data?.salePrice
                              .toString() ??
                              '',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          " so'm",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 8),
                      child: Text(bagsController
                          .list?[index].data?.data?.monthlyPrice ??
                          ''),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  focusColor: Colors.yellow.shade700,
                  value: false,
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
