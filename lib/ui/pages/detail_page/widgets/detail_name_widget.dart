import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/controllers/detailPage_controller.dart';

class DetailName extends StatelessWidget {
  const DetailName({
    super.key,
    required this.detailController,
  });

  final DetailController detailController;

  @override
  Widget build(BuildContext context) {
    return Text(detailController.detailModel.value.data?.data?.name?? 'Texnomart',
      textAlign: TextAlign.start,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),);
  }
}