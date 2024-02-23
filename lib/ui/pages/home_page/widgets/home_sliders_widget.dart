import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:texnomart/data/controllers/homePage_controller.dart';

class HomeSliders extends StatelessWidget {
  HomeSliders({Key? key, required this.homeController}) : super(key: key);
  final HomeController homeController;
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: buttonCarouselController,
      options: CarouselOptions(
        height: 220,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: (index, reason) {
          homeController.getCurrentPosition(index);
        },
        scrollDirection: Axis.horizontal,
      ),
      items: homeController.mainPageModel?.slidersModel?.data?.data?.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 0),
                      blurRadius: 3,
                      blurStyle: BlurStyle.outer,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: i.imageMobileWeb ?? '',
                    fit: BoxFit.fill, 
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
