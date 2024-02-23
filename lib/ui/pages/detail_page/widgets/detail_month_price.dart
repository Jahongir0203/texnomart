import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/controllers/detailPage_controller.dart';

class DetailMonthlyPrice extends StatelessWidget {
  const DetailMonthlyPrice({
    super.key,
    required this.detailController,
  });

  final DetailController detailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Muddatli to'lov:"),
              Text(detailController.detailModel.value.data?.data?.monthlyPrice?? '',style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}