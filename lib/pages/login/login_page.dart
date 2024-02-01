import 'package:flutter/material.dart';
import 'package:gvb_charge/pages/login/login_controller.dart';
import 'package:get/get.dart';
import 'package:gvb_charge/share/pressable.dart';
import 'package:gvb_charge/share/text_style.dart';

import '../../share/colors.dart';
import '../../share/safe_area_loading.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget getBody() {
      return Obx(() => SafeAreaLoading(
          controller.isLoading.value,
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 130,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
                  child: Image.asset("assets/images/logo.png"),
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 25),
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
                          left: 20, top: 15, bottom: 5, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tên đăng nhập", style: xSmallTextStyle),
                          TextField(
                            controller: controller.emailController,
                            cursorColor: black,
                            style: smallTextStyle,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person_2_outlined),
                                prefixIconColor: black,
                                hintText: "Tên đăng nhập",
                                border: InputBorder.none),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 20),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 25),
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
                          left: 20, top: 15, bottom: 5, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mật khẩu",
                            style: xSmallTextStyle,
                          ),
                          TextField(
                            obscureText: true,
                            controller: controller.passwordController,
                            cursorColor: black,
                            style: smallTextStyle,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline_rounded),
                                prefixIconColor: Colors.black,
                                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                                suffixIconColor: Colors.black,
                                hintText: "Password",
                                border: InputBorder.none),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 20),
                Pressable(
                  onPress: () async {
                    await controller.postLogin();
                  },
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: buttoncolor,
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Text(
                        "Đăng nhập",
                        style: smallTextStyle.copyWith(color: white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 62),
                // Padding(
                //   padding: const EdgeInsets.only(left: 26.0, right: 26.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Signup",
                //         style: TextStyle(
                //             color: Colors.black,
                //             fontSize: 15,
                //             fontWeight: FontWeight.w300),
                //       ),
                //       Text(
                //         "Forgot Password?",
                //         style: TextStyle(
                //             color: Colors.black,
                //             fontSize: 15,
                //             fontWeight: FontWeight.w300),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          )));
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
    );
  }
}
