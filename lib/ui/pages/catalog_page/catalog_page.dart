import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/catalog_page_controller.dart';
import 'package:texnomart/data/utils/app_routes.dart';
import 'package:texnomart/data/utils/localeKeys.dart';

class CatalogPage extends StatelessWidget {
  CatalogPage({Key? key}) : super(key: key);
  CatalogController catalogController = Get.find<CatalogController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: SizedBox(
            child: TextField(
                decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mic),
              ),
              hintText: LocaleKeys.hintText.tr,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(6),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(6),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(6),
              ),
            )),
          ),
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: catalogController.isLoading.value
              ? SizedBox(
            height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: const Center(
                    child: CircularProgressIndicator(),
                  ),
              )
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      catalogController.catalogPageModel.data?.data?.length ??
                          0,
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Colors.yellow,
                      onTap: () {
                        Get.toNamed(AppRoutes.catalogCategoriesPage,
                            arguments: catalogController
                                    .catalogPageModel.data?.data?[index] ??
                                '');
                      },
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                              child: SvgPicture.network(catalogController
                                      .catalogPageModel
                                      .data
                                      ?.data?[index]
                                      .icon ??
                                  ''),
                            ),
                            Expanded(
                              flex: 5,
                              child: Text(catalogController.catalogPageModel
                                      .data?.data?[index].name ??
                                  '',style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),),
                            ),
                            const Expanded(
                                child: Icon(
                              Icons.navigate_next,
                              color: Colors.grey,
                            ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
