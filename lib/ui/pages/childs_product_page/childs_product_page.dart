import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/child_products_controller.dart';
import 'package:texnomart/data/models/catalog_page_model.dart';
import 'package:texnomart/data/utils/app_routes.dart';
import 'package:texnomart/data/utils/app_svg.dart';

import '../../../data/services/network_service_demo.dart';

class ChildsProducts extends StatelessWidget {
  ChildsProducts({Key? key, required this.childsModel}) : super(key: key);
  final Childs childsModel;

  @override
  Widget build(BuildContext context) {

   return GetBuilder(
     init:ChildsProductController(
         NetworkServiceDemo(Dio()))
       ..getChildsProduct(childsModel.slug ?? '') ,
     builder: (controller) {

     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.yellow.shade700,
         leading: IconButton(
           onPressed: () {
             Get.back();
           },
           icon: const Icon(Icons.arrow_back),
         ),
         title: Text(childsModel.name ?? ''),
       ),
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 15),
         child: Obx(
               () => Column(
             children: [
               SizedBox(
                 height: 30,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     InkWell(
                       borderRadius: BorderRadius.circular(5),
                       splashColor: Colors.yellow.shade300,
                       onTap: () {},
                       child: const Row(
                         children: [
                           Icon(Icons.swap_vert_outlined),
                           Text("Ommabopligi"),
                         ],
                       ),
                     ),
                     InkWell(
                       borderRadius: BorderRadius.circular(5),
                       splashColor: Colors.yellow.shade300,
                       onTap: () {},
                       child: const Row(
                         children: [
                           Icon(Icons.display_settings),
                           Text("Filtr"),
                         ],
                       ),
                     ),
                     IconButton(
                       onPressed: () {},
                       icon: const Icon(Icons.line_weight),
                     ),
                   ],
                 ),
               ),
               const Divider(),
               SizedBox(
                 height: 30,
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   physics: const BouncingScrollPhysics(),
                   shrinkWrap: true,
                   itemCount: childsModel.childs?.length ?? 0,
                   itemBuilder: (context, index) {
                     return Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 5),
                       child: Container(
                         height: 20,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color:
                           controller.itemIndex.value == index
                               ? Colors.yellow.shade200
                               : Colors.grey.shade200,
                         ),
                         child: MaterialButton(
                           splashColor: Colors.yellow.shade300,
                           shape: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide.none,
                           ),
                           onPressed: () async {
                             controller.getItemIndex(index);
                             await controller.getChildsProduct(
                                 childsModel.childs?[index].slug ?? '');
                           },
                           child: Padding(
                             padding: const EdgeInsets.symmetric(
                                 horizontal: 5, vertical: 2),
                             child: Text(
                               childsModel.childs?[index].name ?? '',
                             ),
                           ),
                         ),
                       ),
                     );
                   },
                 ),
               ),
               Expanded(
                 child: controller.isLoading.value
                     ? const Center(
                   child: CircularProgressIndicator(),
                 )
                     : Padding(
                   padding: const EdgeInsets.only(
                     top: 15,
                   ),
                   child: SingleChildScrollView(
                     child: GridView.builder(
                       itemCount: controller
                           .childsProductModel.value
                           .data
                           ?.products
                           ?.length ??
                           0,
                       scrollDirection: Axis.vertical,
                       shrinkWrap: true,
                       physics: const NeverScrollableScrollPhysics(),
                       gridDelegate:
                       const SliverGridDelegateWithFixedCrossAxisCount(
                         childAspectRatio: 0.5,
                         crossAxisCount: 2,
                         mainAxisSpacing: 4,
                         crossAxisSpacing: 4,
                       ),
                       itemBuilder: (context, index) {
                         return InkWell(
                           splashColor: Colors.yellow,
                           onTap: () {
                             Get.toNamed(AppRoutes.detailPage,
                                 arguments: controller
                                     .childsProductModel.value
                                     .data
                                     ?.products?[index]
                                     .id ??
                                     0);
                           },
                           child: Container(
                             color: Colors.white,
                             child: Padding(
                               padding: const EdgeInsets.only(
                                 top: 15,
                                 bottom: 8,
                                 right: 8,
                                 left: 8,
                               ),
                               child: Column(
                                 crossAxisAlignment:
                                 CrossAxisAlignment.start,
                                 children: [
                                   SizedBox(
                                     height: MediaQuery.of(context)
                                         .size
                                         .height /
                                         5,
                                     child: CachedNetworkImage(
                                       errorWidget:
                                           (context, url, error) =>
                                       const Icon(Icons.error),
                                       imageUrl: controller
                                           .childsProductModel.value
                                           .data
                                           ?.products?[index]
                                           .image ??
                                           '',
                                       fit: BoxFit.fill,
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.symmetric(
                                         horizontal: 2, vertical: 5),
                                     child: Text(
                                       controller
                                           .childsProductModel.value.data
                                           ?.products?[index]
                                           .name ??
                                           '',
                                       maxLines: 2,
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(
                                         top: 3, bottom: 3),
                                     child: Row(
                                       children: [
                                         for (int i = 0; i < 5; i++)
                                           const Icon(
                                             Icons.star,
                                             color: Colors.grey,
                                             size: 20,
                                           ),
                                       ],
                                     ),
                                   ),
                                   Container(
                                     height: 25,
                                     decoration: BoxDecoration(
                                       borderRadius:
                                       BorderRadius.circular(15),
                                       color: Colors.grey.shade300,
                                     ),
                                     child: Padding(
                                       padding: const EdgeInsets.symmetric(
                                           horizontal: 8, vertical: 3),
                                       child: Text(
                                         controller
                                             .childsProductModel.value.data
                                             ?.products?[index]
                                             .axiomMonthlyPrice ??
                                             ''.split('с').first,
                                       ),
                                     ),
                                   ),
                                   Padding(
                                     padding:
                                     const EdgeInsets.only(top: 20),
                                     child: Row(
                                       mainAxisAlignment:
                                       MainAxisAlignment.spaceBetween,
                                       children: [
                                         Text(
                                           controller
                                               .childsProductModel.value.data
                                               ?.products?[index]
                                               .fSalePrice ??
                                               '',
                                           style: const TextStyle(
                                             color: Colors.black,
                                             fontWeight: FontWeight.w600,
                                           ),
                                         ),
                                         Container(
                                           decoration: BoxDecoration(
                                             borderRadius:
                                             BorderRadius.circular(5),
                                             border: Border.all(
                                               color:
                                               Colors.yellow.shade700,
                                               width: 2,
                                             ),
                                           ),
                                           child: Padding(
                                             padding:
                                             const EdgeInsets.all(5.0),
                                             child: SvgPicture.asset(
                                                 AppSvg.kAcMarket),
                                           ),
                                         )
                                       ],
                                     ),
                                   )
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
           ),
         ),
       ),
     );
   },);
  }
}
