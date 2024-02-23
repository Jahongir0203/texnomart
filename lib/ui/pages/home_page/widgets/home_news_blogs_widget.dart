import 'package:flutter/material.dart';

import '../../../../data/controllers/homePage_controller.dart';

class HomeNewsVsBlogs extends StatelessWidget {
  const HomeNewsVsBlogs({Key? key, required this.homeController}) : super(key: key);
 final HomeController homeController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount:
        homeController.mainPageModel!.newsModel!.data!.data?.length ?? 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
              width: 270,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(homeController.mainPageModel!
                            .newsModel!.data!.data![index].src ??
                            '',
                          width: 270,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(homeController.mainPageModel!.newsModel!.data!
                          .data![index].publishDate ??
                          '',style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:2),
                      child: Text(
                        homeController.mainPageModel!.newsModel!.data!
                            .data![index].title ??
                            '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

