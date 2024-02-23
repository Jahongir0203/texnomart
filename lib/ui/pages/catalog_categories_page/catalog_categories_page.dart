import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/utils/app_routes.dart';

import '../../../data/models/catalog_page_model.dart';

class CategoriesCatalogPage extends StatelessWidget {
  const CategoriesCatalogPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  final DataCatalog data;

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
          data.name ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.childs?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: InkWell(
                splashColor: Colors.yellow,
                onTap: () {
                  Get.toNamed(
                    AppRoutes.catalogChildsPage,
                    arguments: data.childs?[index],
                  );
                },
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.childs?[index].name ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      const Icon(Icons.navigate_next,color: Colors.grey,),
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
