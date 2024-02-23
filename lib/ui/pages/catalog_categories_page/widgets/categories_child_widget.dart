import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/child_products_controller.dart';
import 'package:texnomart/data/services/network_service.dart';
import 'package:texnomart/data/utils/app_routes.dart';
import 'package:dio/dio.dart';
import '../../../../data/models/catalog_page_model.dart';

class CatalogChilds extends StatelessWidget {
  CatalogChilds({Key? key, required this.childs}) : super(key: key);
  final Childs childs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade700,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          childs.name ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: childs.childs?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                splashColor: Colors.yellow,
                onTap: () {
                  Get.toNamed(AppRoutes.childsProductPage, arguments: childs);
                },
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        childs.childs?[index].name ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(
                        Icons.navigate_next,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
