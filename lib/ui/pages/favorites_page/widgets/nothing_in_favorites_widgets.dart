import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../data/utils/app_svg.dart';
import '../../../../data/utils/localeKeys.dart';

class NothingInFavorites extends StatelessWidget {
  const NothingInFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppSvg.kFavorite,height: 60,width: 60,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(LocaleKeys.nothingFavorite.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
