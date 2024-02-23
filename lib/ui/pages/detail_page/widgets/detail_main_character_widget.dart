import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/controllers/detailPage_controller.dart';

class DetailMainCharacters extends StatelessWidget {
  const DetailMainCharacters({
    super.key,
    required this.detailController,
  });

  final DetailController detailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount:
            detailController.detailModel.value.data?.data?.mainCharacters?.length ??
                0,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    '${detailController.detailModel.value.data?.data?.mainCharacters?[index].name}'),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: DottedDashedLine(
                        height: 0, width: 80, axis: Axis.horizontal),
                  ),
                ),
                Text(
                    '${detailController.detailModel.value.data?.data?.mainCharacters?[index].value}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
