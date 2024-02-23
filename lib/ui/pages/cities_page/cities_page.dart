import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/controllers/cities_controller.dart';
import 'package:texnomart/data/utils/App_lists.dart';
import 'package:texnomart/data/utils/localeKeys.dart';

class CitiesPage extends StatelessWidget {
  CitiesPage({Key? key}) : super(key: key);
  CitiesController citiesController = Get.find<CitiesController>();

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
        title: Text(LocaleKeys.cities.tr),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cities.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  citiesController.getCity(cities[index]);
                  Get.back();
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: citiesController.city.value == cities[index]
                        ? Colors.yellow
                        : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(cities[index]),
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
