import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:texnomart/data/controllers/detailPage_controller.dart';

class DetailHave extends StatelessWidget {
  const DetailHave({
    super.key,
    required this.detailController,
  });

  final DetailController detailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Mavjud',style: TextStyle(color: Colors.green),),
          Text('Kod.${detailController.detailModel.value.data?.data?.id?? ''}'),
        ],
      ),
    );
  }
}
