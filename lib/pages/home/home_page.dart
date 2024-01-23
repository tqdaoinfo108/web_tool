// ignore_for_file: depend_on_referenced_packages
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class HomePage extends GetView<HomeController> {
  Widget buildBodyHome() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            FlutterMap(
              mapController: controller.mapController,
              options: const MapOptions(
                initialCenter: LatLng(51.5, -0.09),
                initialZoom: 17,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  evictErrorTileStrategy: EvictErrorTileStrategy.none,
                  errorTileCallback: (tile, error, stackTrace) {},
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: CarouselSlider(
                options: CarouselOptions(
                    height: 170,
                    autoPlay: false,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    enlargeFactor: 0,
                    initialPage: 0),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          padding: const EdgeInsets.all(20),
                          decoration:
                              radiusContainer(Colors.white.withOpacity(0.7)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '70 Đ. Lữ Gia, Phường 15, Quận 11, Thành phố Hồ Chí Minh 70000',
                                  style: textLarge()),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Lữ gia Plaza', style: textNormal()),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(Icons.brightness_1,
                                              color: Colors.green),
                                          const SizedBox(width: 8),
                                          Text("Mở cửa",
                                              style: textNormal(isBold: true))
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: Get.size.width * 0.3,
                                    child: Wrap(
                                      children: [
                                        for (var i = 0; i < 3; i++)
                                          const Icon(Icons.brightness_1,
                                              color: grey, size: 18),
                                        for (var i = 0; i < 17; i++)
                                          const Icon(Icons.brightness_1,
                                              color: green, size: 18),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ));
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      buildBodyHome(),
      const ProfilePage(),
    ];

    Widget getBody() {
      return IndexedStack(
        index: controller.pageIndex.value,
        children: pages,
      );
    }

    return Obx(() => Scaffold(
          backgroundColor: bgColor,
          body: getBody(),
          floatingActionButton: SafeArea(
            child: SizedBox(
              width: 80,
              height: 80,
              child: FloatingActionButton(
                onPressed: () {
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
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: getFooter(),
        ));
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      CupertinoIcons.home,
      CupertinoIcons.person,
    ];
    return AnimatedBottomNavigationBar(
        backgroundColor: white,
        icons: iconItems,
        splashColor: secondary,
        inactiveColor: black.withOpacity(0.5),
        activeIndex: controller.pageIndex.value,
        iconSize: 25,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        elevation: 1,
        onTap: (index) {
          controller.setTabs(index);
        });
  }
}
