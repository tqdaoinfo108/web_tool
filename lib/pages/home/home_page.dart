// ignore_for_file: depend_on_referenced_packages
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gvb_charge/model/parking_model.dart';
import 'package:gvb_charge/pages/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';

import '../../share/colors.dart';
import '../../share/radius.dart';
import '../../share/text_style.dart';
import '../profile/profile_page.dart';
import 'history_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  Widget buildBodyHome() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Obx(() => FlutterMap(
                  mapController: controller.mapController,
                  options: const MapOptions(
                    initialCenter: LatLng(10.771423, 106.698471),
                    initialZoom: 17,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://api.mapbox.com/styles/v1/tranquocdao108/cl7ej62u7000015mt54hc1a1c/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidHJhbnF1b2NkYW8xMDgiLCJhIjoiY2swZjQ2dWxzMDcwNTNtbXh1OXVwbGwyayJ9.zd_7KBxex95xUOMBJl7ISA',
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                      // Use the recommended flutter_map_cancellable_tile_provider package to
                      // support the cancellation of loading tiles.
                    ),
                    MarkerLayer(markers: controller.listMarker.value),
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Obx(
                  () => CarouselSlider(
                    options: CarouselOptions(
                        height: 200,
                        autoPlay: false,
                        viewportFraction: 0.93,
                        enlargeCenterPage: true,
                        enlargeFactor: 0,
                        initialPage: 0),
                    items: controller.listPark.value.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return ParkCellItem(i, controller);
                        },
                      );
                    }).toList(),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      buildBodyHome(),
      historyPage(controller),
      const ProfilePage(),
    ];

    Widget getBody() {
      return IndexedStack(
        index: controller.pageIndex.value,
        children: pages,
      );
    }

    return Obx(() => controller.isLoading.value
        ? const Scaffold(
            body: SafeArea(child: Center(child: CircularProgressIndicator())))
        : Scaffold(
            backgroundColor: bgColor,
            body: getBody(),
            floatingActionButton: SafeArea(
              child: SizedBox(
                width: 80,
                height: 80,
                child: FloatingActionButton(
                  onPressed: () async {
                    Get.toNamed("/qr_scan");
                  },
                  backgroundColor: white,
                  elevation: 0,
                  focusColor: primary,
                  hoverColor: primary,
                  focusElevation: 0,
                  hoverElevation: 0,
                  shape: const CircleBorder(),
                  child: Lottie.asset('assets/lottie/qr_scan.json'),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            bottomNavigationBar: getFooter(),
          ));
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      CupertinoIcons.home,
      CupertinoIcons.arrow_up_arrow_down,
      CupertinoIcons.person,
    ];
    return AnimatedBottomNavigationBar(
        backgroundColor: white,
        icons: iconItems,
        splashColor: secondary,
        inactiveColor: black.withOpacity(0.5),
        activeIndex: controller.pageIndex.value,
        iconSize: 25,
        gapLocation: GapLocation.end,
        notchSmoothness: NotchSmoothness.smoothEdge,
        elevation: 1,
        onTap: (index) {
          controller.setTabs(index);
        });
  }
}

Widget ParkCellItem(ParkingModel data, HomeController controller) {
  return GestureDetector(
    onTap: () {
      controller.mapController.move(data.getLatLng, 17);
    },
    child: Container(
        width: Get.width * 0.99,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: radiusContainer(Colors.white.withOpacity(0.7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.addressParking ?? "", style: smallTextStyle),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.nameParking ?? "", style: xSmallTextStyle),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.brightness_1, color: Colors.green),
                        const SizedBox(width: 8),
                        Text("Mở cửa", style: xSmallTextStyle)
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: Get.size.width * 0.3,
                  child: Wrap(
                    children: [
                      // for (var i = 0; i < 3; i++)
                      //   const Icon(Icons.brightness_1, color: grey, size: 18),
                      for (var i = 0; i < (data.powerSocketAvailable ?? 0); i++)
                        const Icon(Icons.brightness_1, color: green, size: 18),
                    ],
                  ),
                )
              ],
            )
          ],
        )),
  );
}
