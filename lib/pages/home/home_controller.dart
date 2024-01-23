// ignore_for_file: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
// ignore: unused_import
import 'package:latlong2/latlong.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

class HomeController extends GetxController {
  RxInt pageIndex = 0.obs;
  MapController mapController = MapController();

  @override
  void onInit() {
    super.onInit();
    // initMap();
  }

  initMap() async {
    var position = await _determinePosition();
    if (position.isBlank ?? false) {
      return;
    }
    var latlng = LatLng(position.latitude, position.longitude);
    mapController.move(latlng, 17);
  }

  setTabs(index) {
    pageIndex.value = index;
    update();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   // Location services are not enabled don't continue
    //   // accessing the position and request users of the
    //   // App to enable the location services.
    //   return Future.error('Location services are disabled.');
    // }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
