import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/homePage_controller.dart';

import '../../../../data/utils/localeKeys.dart';

class HomeNamedTitles extends StatelessWidget {
  const HomeNamedTitles({Key? key, required this.name, required this.onTap, required this.isDone}) : super(key: key);
  final String name;
  final Function onTap;
  final bool isDone;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name.tr,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
         isDone? TextButton(
            onPressed: () {
              onTap();
            },
            child: Text('${LocaleKeys.all.tr}>'),
          ) : Container(),
        ],
      ),
    );
  }
}
