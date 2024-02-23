import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/bags_controller.dart';
import 'package:texnomart/data/models/favorite_product_model.dart';

class ItemActions extends StatelessWidget {
  const ItemActions({
    super.key,
    required this.bagsController,
    required this.index,
  });

  final BagsController bagsController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container()),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 62),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(Icons.remove),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical:1,horizontal: 2),
                          child: Center(child: Text("1")),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (bagsController.listFavorites!.value.contains(
                            bagsController.list![index].data?.data?.id)) {
                          bagsController.deleteLikedProducts(
                              bagsController.list![index].data?.data?.id ?? 0);
                          bagsController.deleteFavoriteProduct(
                              bagsController.list![index].data?.data?.id ?? 0);
                        } else {
                          bagsController.saveLikedProducts(FavoriteProductModel(
                            name: bagsController.list![index].data?.data?.name?? '',
                            imageUrl:bagsController.list![index].data?.data?.smallImages?[0]?? '' ,
                            monthlyPrice: bagsController.list![index].data?.data?.monthlyPrice?? '',
                            salePrice: bagsController.list![index].data?.data?.salePrice?? 0,
                            id: bagsController.list![index].data?.data?.id??0


                          ));
                          bagsController.saveFavoriteProducts(
                              bagsController.list![index].data?.data?.id ?? 0);
                        }
                      },
                      icon: bagsController.listFavorites!.value.contains(
                              bagsController.list![index].data?.data?.id)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_border),
                    ),
                    IconButton(
                      onPressed: () async {
                        await bagsController.deleteProducts(
                            bagsController.list?[index].data?.data?.id ?? 0);
                        await bagsController.getProducts();
                      },
                      icon: const Icon(Icons.delete_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
