import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../data/controllers/detailPage_controller.dart';

class DetailCarouselSliders extends StatelessWidget {
  const DetailCarouselSliders({
    super.key,
    required this.detailController,
  });

  final DetailController detailController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        width: MediaQuery.of(context).size.width,
        child:
        CarouselSlider.builder(
          itemCount:detailController.detailModel.value.data?.data
              ?.smallImages?.length?? 0,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 20),
                child: CachedNetworkImage(
                  progressIndicatorBuilder:
                      (context, url, progress) =>
                      LoadingAnimationWidget.twoRotatingArc(
                        color: Colors.black,
                        size: 20,
                      ),
                  imageUrl: detailController.detailModel.value.data?.data
                      ?.smallImages?[itemIndex] ??
                      '',
                ),
              ), options: CarouselOptions(
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged:(index, reason){
            detailController.getCurrentIndex(index);
          },
          scrollDirection: Axis.horizontal,
        ),
        )
    );
  }
}