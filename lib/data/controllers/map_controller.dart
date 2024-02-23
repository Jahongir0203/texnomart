import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Rx<BitmapDescriptor> _markerIcon = BitmapDescriptor.defaultMarker.obs;
  RxBool _isLoading = false.obs;

  Rx<BitmapDescriptor> get markerIcon => _markerIcon;

  RxBool get isLoading => _isLoading;

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/png/location.png')
        .then(
      (icon) {
        _markerIcon.value = icon;

      },
    );
  }
}
