import 'package:flutter/material.dart';
import 'package:gvb_charge/pages/pick_time/pick_time_booking_controller.dart';
import 'package:gvb_charge/share/appbar.dart';
import 'package:gvb_charge/share/c_button.dart';
import 'package:gvb_charge/share/colors.dart';
import 'package:gvb_charge/share/pressable.dart';
import 'package:gvb_charge/share/text_style.dart';
import 'package:get/get.dart';

class PickTimeBookingPage extends GetView<PickTimeBookingController> {
  const PickTimeBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget itemPickTimeBooking(int time) {
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Pressable(
            onPress: () => controller.onChangeItemTime(time),
            child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: time == controller.timeBookingCurent.value
                        ? primary.withOpacity(.4)
                        : null,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: const Color(0xFF767D88))),
                child: Text(
                  "$time giờ",
                  style: xSmallTextStyle,
                ))),
      );
    }

    return Scaffold(
        appBar: CAppbar("Chọn giờ"),
        body: Obx(
          () => SafeArea(
              child: controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Obx(
                            () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Chọn dịch vụ sử dụng",
                                      style: xSmallTextStyle),
                                  const SizedBox(height: 10),
                                  Wrap(children: [
                                    for (var item in controller.listTimeBooking)
                                      itemPickTimeBooking(item)
                                  ]),
                                  const SizedBox(height: 20),
                                  buttonDefault("Sạc", () async {
                                    await controller.onChargingON();
                                  }),
                                ]),
                          )),
                    )),
        ));
  }
}
