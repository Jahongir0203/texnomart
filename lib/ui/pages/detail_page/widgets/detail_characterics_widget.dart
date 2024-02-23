import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/models/detail_model.dart';
import 'package:texnomart/data/utils/app_svg.dart';

class DetailCharactericsPage extends StatelessWidget {
  const DetailCharactericsPage({Key? key, required this.list})
      : super(key: key);
  final List<CharactericsModel> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade700,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(AppSvg.kIcX)),
        title: Text("Xususiyatlari"),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    list[index].name ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: list[index].characters?.length?? 0,
                    itemBuilder: (context, i) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(list[index].characters?[i].name?? '',
                          maxLines: 3,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: DottedDashedLine(
                                height: 0, axis: Axis.horizontal, width:100,),
                          ),
                        ),

                        Text(list[index].characters?[i].value?? '',
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    );
                  },),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
