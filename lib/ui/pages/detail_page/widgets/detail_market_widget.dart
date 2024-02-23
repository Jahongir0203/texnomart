import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/models/detail_model.dart';
import 'package:texnomart/data/utils/app_routes.dart';
import 'package:texnomart/data/utils/app_svg.dart';
import 'package:texnomart/data/utils/localeKeys.dart';

class DetailShopsPage extends StatelessWidget {
  const DetailShopsPage({Key? key, required this.shopsModel}) : super(key: key);
  final List<AvailableStores> shopsModel;

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
          LocaleKeys.shops.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.mapPage,arguments: shopsModel);
            },
            icon: const Icon(Icons.map),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                autocorrect: true,
                autofocus: true,
                decoration: InputDecoration(
                  filled: true,
                  alignLabelWithHint: true,
                  contentPadding: const EdgeInsets.all(0),
                  fillColor: Colors.grey.shade200,
                  prefixIcon: const Icon(Icons.search),
                  hintText: LocaleKeys.address.tr,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
               scrollDirection: Axis.vertical,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: shopsModel.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SvgPicture.asset(AppSvg.kLocation),
                          ),
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  shopsModel[index].address ?? '',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                ),
                                Text(
                                  shopsModel[index].workTime ?? '',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Icon(Icons.navigate_next,color: Colors.grey,),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
