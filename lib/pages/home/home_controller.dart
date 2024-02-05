// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gvb_charge/model/booking_detail_model.dart';
import 'package:gvb_charge/model/user_model.dart';
import 'package:gvb_charge/share/constant.dart';
// ignore: unused_import
import 'package:latlong2/latlong.dart';

import '../../model/parking_model.dart';
import '../../service/http_client.dart';
import '../../share/c_getx_controller.dart';

class HomeBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<HomeController>(() => HomeController(Get.find())),
    ];
  }
}

class HomeController extends GetXControllerCustom
    with GetTickerProviderStateMixin {
  RxInt pageIndex = 0.obs;
  late MapController mapController;

  Rx<UserModel?> userData = Rx<UserModel?>(null);
  RxList<ParkingModel> listPark = RxList([]);
  RxList<Marker> listMarker = RxList([]);
  RxList<BookingDetail> listBooking = RxList([]);

  final HttpClient _httpClient;
  HomeController(this._httpClient);

  @override
  void onInit() {
    super.onInit();
    mapController = MapController();
    init();
  }

  @override
  void onReady() {
    super.onReady();
    initMap();
  }

  init() async {
    isLoading.value = true;
    await Future.wait(
        [getUserProfile(), getListPark(), getListHistoryBooking(1)]);
    isLoading.value = false;
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
    if (index == 1) {
      getListHistoryBooking(1);
    }
  }

  Future getUserProfile() async {
    userData.value = (await _httpClient.getProfile()).body?.data;
  }

  Future getListHistoryBooking(int page) async {
    if (page == 1) {
      listBooking.value.clear();
    }
    listBooking.value =
        (await _httpClient.getListBookingHistory(page)).body?.data ?? [];
    listBooking.refresh();
  }

  Future getListPark() async {
    listPark.value =
        (await _httpClient.getListPark("", 1, 1000)).body?.data ?? [];

    for (var item in listPark.value) {
      listMarker.value.add(
        Marker(
            point: item.getLatLng,
            width: 32,
            height: 32,
            child: Image.asset("assets/images/f.png")),
      );
    }

    listPark.refresh();
    listMarker.refresh();
  }

  Future onEndBooking(int bookingID) async {
    try {
      var result = await _httpClient.getEndBooking(bookingID);
      if (result.isOk) {
        await getListHistoryBooking(1);
        Get.snackbar("Thông báo", "Kết thúc sạc thành công");
      }
    } finally {}
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

  // profile
  RxBool isHideMoney = true.obs;
  onChangeHidMoney() {
    isHideMoney.value = !isHideMoney.value;
  }
}
