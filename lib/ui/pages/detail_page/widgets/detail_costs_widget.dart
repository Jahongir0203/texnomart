import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:texnomart/data/controllers/detailPage_controller.dart';

class DetailCosts extends StatelessWidget {
  const DetailCosts({Key? key, required this.detailController}) : super(key: key);
 final DetailController detailController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Row(
            children: [
              Text(detailController.detailModel.value.data?.data?.loanPrice.toString()?? ''),
              const Text("so'm"),
            ],
          ),
        ),
        Row(
          children: [
            Text(detailController.detailModel.value.data?.data?.salePrice.toString()?? ''+"so'm",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(" so'm",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),

          ],
        ),

      ],
    );
  }
}
