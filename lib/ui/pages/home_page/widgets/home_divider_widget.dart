import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDivider extends StatelessWidget {
  const HomeDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: Divider(),
    );
  }
}
