import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gvb_charge/share/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gvb_charge/share/text_style.dart';
import 'package:get/get.dart';

import '../../share/pressable.dart';
import 'home_controller.dart';

Widget historyPage(HomeController controller) {
  return Obx(() => ListView.builder(
      itemBuilder: (context, i) {
        var itemBooking = controller.listBooking.value[i];
        String textStatus =
            itemBooking.statusBooking == 0 ? "Đang sạc" : "Đã sạc xong";
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Stack(
            children: [
              Pressable(
                padding: const EdgeInsets.all(20),
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
                backgroundColor: white,
                onPress: () {},
                enabled: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // RichText(
                    //   text: TextSpan(
                    //     style: xSmallTextStyle,
                    //     children: <InlineSpan>[
                    //       TextSpan(text: "111111111"),
                    //       TextSpan(text: "2222222}"),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 10),
                    Text(itemBooking.nameParking ?? "", style: mediumTextStyle),
                    const SizedBox(height: 10),
                    Text(itemBooking.addressParking ?? "",
                        style: smallTextStyle),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(itemBooking.getStartTime, style: xSmallTextStyle),
                        const SizedBox(width: 10),
                        const Icon(CupertinoIcons.clock,
                            size: 18, color: Color(0xFF767D88)),
                        const SizedBox(width: 4),
                        Text(itemBooking.getEndTime, style: xSmallTextStyle),
                      ],
                    ),
                    if (itemBooking.statusBooking == 0)
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Divider(height: 1, color: grey.withOpacity(.3)),
                          const SizedBox(height: 10),
                          Pressable(
                              onPress: () async =>
                                  controller.onEndBooking(itemBooking.bookId!),
                              child: Text("KẾT THÚC",
                                  style: mediumTextStyle.copyWith(
                                      color: red,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  decoration: BoxDecoration(
                      color: itemBooking.statusBooking == 0
                          ? Colors.yellow[400]
                          : Colors.green[400],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(2.0.h),
                        bottomLeft: const Radius.circular(8),
                      ) // green shaped
                      ),
                  child: Text(
                    "$textStatus - #${itemBooking.code}",
                    style: smallTextStyle,
                  ),
                ),
              )
            ],
          ),
        );
      },
      itemCount: controller.listBooking.value.length));
}
