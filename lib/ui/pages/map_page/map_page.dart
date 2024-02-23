import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:texnomart/data/controllers/map_controller.dart';
import 'package:texnomart/data/models/detail_model.dart';
import 'package:texnomart/data/utils/localeKeys.dart';

class MapPage extends StatelessWidget {
  MapPage({Key? key, required this.stores}) : super(key: key);
  final List<AvailableStores> stores;

  late GoogleMapController mapController;


  MapController mapControllerX = Get.put(MapController())..addCustomIcon();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

//const ImageConfiguration(), AppSvg.kLocation
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow.shade700,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back),
            ),
            title: Text(LocaleKeys.Market.tr),
          ),
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(41.311081, 69.240562),
              zoom: 11,
            ),
            markers: {
              for (int i = 0; i < stores.length; i++)
                Marker(
                  markerId: MarkerId(stores[i].name ?? 'Texnomart'),
                  visible: true,
                  position: LatLng(
                    double.parse(stores[i].lat ?? '0'),
                    double.parse(stores[i].long ?? '0'),
                  ),
                  infoWindow: InfoWindow(
                    title: stores[i].name ?? "Texnomart",
                  ),
                  icon: mapControllerX.markerIcon.value,
                ),
            },
          ),
        ));
  }
}
