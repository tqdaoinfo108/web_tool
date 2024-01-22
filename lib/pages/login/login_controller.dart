import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

class LoginController extends GetxController {
  final TextEditingController emailController =
      TextEditingController(text: "Username@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "abcdef123456");
}
