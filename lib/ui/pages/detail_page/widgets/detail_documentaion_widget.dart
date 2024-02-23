import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/utils/app_svg.dart';

class DetailDocumentationPage extends StatelessWidget {
  const DetailDocumentationPage({Key? key, required this.text})
      : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade700,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(AppSvg.kIcX),
        ),
        title: const Text("Tarif"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Container(child: Html(data: text)),
        ),
      ),
    );
  }
}
