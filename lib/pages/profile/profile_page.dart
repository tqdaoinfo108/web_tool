// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gvb_charge/model/user_model.dart';
import 'package:gvb_charge/pages/home/home_controller.dart';
import 'package:gvb_charge/share/pressable.dart';

import '../../share/colors.dart';
import '../../share/text_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      return SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 25, left: 25, right: 25, bottom: 10),
              padding: const EdgeInsets.only(
                  top: 20, bottom: 25, right: 20, left: 20),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.userData.value?.fullName ?? "",
                            style:
                                mediumTextStyle.copyWith(color: mainFontColor),
                          ),
                          const SizedBox(height: 10),
                          Obx(() => Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () => controller.onChangeHidMoney(),
                                    child: Icon(
                                        controller.isHideMoney.value
                                            ? CupertinoIcons.eye_fill
                                            : CupertinoIcons.eye_slash_fill,
                                        color: grey),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                      controller.isHideMoney.value
                                          ? "***********"
                                          : "1234567",
                                      style: smallTextStyle),
                                  const SizedBox(width: 20),
                                  // GestureDetector(
                                  //   child: Container(
                                  //     padding: const EdgeInsets.symmetric(
                                  //         horizontal: 10, vertical: 8),
                                  //     decoration: BoxDecoration(
                                  //         color: primary,
                                  //         borderRadius: BorderRadius.circular(25),
                                  //         boxShadow: [
                                  //           BoxShadow(
                                  //             color: grey.withOpacity(0.03),
                                  //             spreadRadius: 10,
                                  //             blurRadius: 3,
                                  //             // changes position of shadow
                                  //           ),
                                  //         ]),
                                  //     child: Row(
                                  //       children: [
                                  //         const Icon(CupertinoIcons.add_circled),
                                  //         const SizedBox(width: 8),
                                  //         Text("Nộp tiền", style: smallTextStyle),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ))
                        ],
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://lumiere-a.akamaihd.net/v1/images/a_avatarpandorapedia_neytiri_16x9_1098_01_0e7d844a.jpeg?region=240%2C0%2C1440%2C1080"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Cài đặt",
                              style: mediumTextStyle.copyWith(
                                  color: mainFontColor)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.only(
                  top: 10, left: 25, right: 25, bottom: 10),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  children: [
                    ListTile(
                        leading: const Icon(CupertinoIcons.creditcard,
                            color: primary),
                        title: Text("Nộp tiền", style: xSmallTextStyle),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded,
                            color: arrowbgColor)),
                    ListTile(
                        leading: const Icon(CupertinoIcons.person_circle,
                            color: primary),
                        title:
                            Text("Thông tin tài khoản", style: xSmallTextStyle),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded,
                            color: arrowbgColor)),
                    ListTile(
                        leading: const Icon(CupertinoIcons.phone_circle,
                            color: primary),
                        title: Text("Liên hệ", style: xSmallTextStyle),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded,
                            color: arrowbgColor)),
                    ListTile(
                        leading: const Icon(CupertinoIcons.book_circle,
                            color: primary),
                        title:
                            Text("Câu hỏi thường gặp", style: xSmallTextStyle),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded,
                            color: arrowbgColor)),
                    ListTile(
                        onTap: () {
                          UserModel.remoxUserID;
                          Get.offAndToNamed("/login");
                        },
                        leading: const Icon(CupertinoIcons.delete_right,
                            color: primary),
                        title: Text("Đăng xuất", style: xSmallTextStyle),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded,
                            color: arrowbgColor)),
                    const SizedBox(height: 10),
                    Container(
                        alignment: Alignment.centerRight,
                        child: Text("Phiên bản 1.0.0", style: xXSmallTextStyle))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Lịch sử gần nhất", style: mediumTextStyle),
                        ],
                      )
                    ],
                  ),
                  Text("Xem tất cả",
                      style:
                          smallTextStyle.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 10,
                            left: 25,
                            right: 25,
                          ),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: grey.withOpacity(0.03),
                                  spreadRadius: 10,
                                  blurRadius: 3,
                                  // changes position of shadow
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, right: 20, left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: arrowbgColor,
                                    borderRadius: BorderRadius.circular(15),
                                    // shape: BoxShape.circle
                                  ),
                                  child: const Center(
                                      child: Icon(Icons.arrow_upward_sharp)),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Thanh toán tại Lữ gia",
                                          style: smallTextStyle,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "15:03 22/01/2024",
                                          style: xSmallTextStyle,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "Số dư ví: **********",
                                          style: xSmallTextStyle,
                                        ),
                                      ]),
                                ),
                                IntrinsicWidth(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "-200.000đ",
                                        style: smallTextStyle.copyWith(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 10,
                            left: 25,
                            right: 25,
                          ),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: grey.withOpacity(0.03),
                                  spreadRadius: 10,
                                  blurRadius: 3,
                                  // changes position of shadow
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, right: 20, left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: arrowbgColor,
                                    borderRadius: BorderRadius.circular(15),
                                    // shape: BoxShape.circle
                                  ),
                                  child: const Center(
                                      child:
                                          Icon(Icons.arrow_downward_rounded)),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nạp tiền vào từ chi nhánh Lữ gia",
                                          style: smallTextStyle,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "15:03 22/01/2024",
                                          style: xSmallTextStyle,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "Số dư ví: **********",
                                          style: xSmallTextStyle,
                                        ),
                                      ]),
                                ),
                                IntrinsicWidth(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "+200.000đ",
                                        style: smallTextStyle.copyWith(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 10,
                            left: 25,
                            right: 25,
                          ),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: grey.withOpacity(0.03),
                                  spreadRadius: 10,
                                  blurRadius: 3,
                                  // changes position of shadow
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, right: 20, left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: arrowbgColor,
                                    borderRadius: BorderRadius.circular(15),
                                    // shape: BoxShape.circle
                                  ),
                                  child: const Center(
                                      child:
                                          Icon(Icons.arrow_downward_rounded)),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nạp tiền vào từ chi nhánh Lữ gia",
                                          style: smallTextStyle,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "15:03 22/01/2024",
                                          style: xSmallTextStyle,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "Số dư ví: **********",
                                          style: xSmallTextStyle,
                                        ),
                                      ]),
                                ),
                                IntrinsicWidth(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("THẤT BẠI",
                                          style: smallTextStyle.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: red)),
                                      Text(
                                        "+200.000đ",
                                        style: smallTextStyle.copyWith(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ));
    });
  }
}
