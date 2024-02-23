import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/bags_controller.dart';
import 'package:texnomart/data/controllers/main_controller.dart';
import 'package:texnomart/data/services/storage_service.dart';
import 'package:texnomart/data/utils/app_routes.dart';
import 'package:texnomart/data/utils/localeKeys.dart';
import 'package:texnomart/ui/pages/market_page/widgets/item_actions_widget.dart';
import 'package:texnomart/ui/pages/market_page/widgets/item_details_widget.dart';
import 'package:texnomart/ui/pages/market_page/widgets/nothing_in_bag.dart';
import 'package:texnomart/ui/pages/market_page/widgets/select_all_button_widget.dart';

class MarketPage extends StatelessWidget {
  MarketPage({Key? key}) : super(key: key);
  MainController mainController = Get.find<MainController>();
  BagsController bagsController = Get.find<BagsController>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade700,
        title: Text(LocaleKeys.market.tr),
      ),
      body: Obx(
        () => bagsController.hasProducts.value
            ? Column(
                children: [
                  const SelectAllButton(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: bagsController.list?.length ?? 0,
                          itemBuilder: (context, index) {
                            return InkWell(
                              splashColor: Colors.yellow,
                              onTap: () {
                                 Get.toNamed(AppRoutes.detailPage,
                                    arguments: bagsController
                                            .list?[index].data?.data?.id ??
                                        0);
                              },
                              child: SizedBox(
                                height: 220,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Column(
                                    children: [
                                      ItemDetails(
                                          bagsController: bagsController,
                                          index: index),
                                      const SizedBox(height: 8,),
                                      ItemActions(bagsController: bagsController, index:index ),
                                      const Divider(
                                        endIndent: 10,
                                        indent: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : NothingInBag(mainController: mainController),
      ),
    );
  }
}
