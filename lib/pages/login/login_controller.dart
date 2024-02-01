import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gvb_charge/model/user_model.dart';
import 'package:gvb_charge/service/http_client.dart';

import '../../share/c_getx_controller.dart';

class LoginBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<HttpClient>(() => HttpClient()),
      Bind.lazyPut<LoginController>(() => LoginController(Get.find())),
    ];
  }
}

class LoginController extends GetXControllerCustom {
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");
  final HttpClient _httpClient;
  LoginController(this._httpClient);

  @override
  void onInit() {
    super.onInit();
    // Đã đăng nhập rồi
  }

  @override
  void onClose() {
    super.onInit();
    emailController.text = "";
    passwordController.text = "";
  }

  @override
  void onReady() {
    super.onReady();
    isLoading.value = UserModel.getUSerID != 0;
    if (UserModel.getUSerID != 0) {
      Get.offAndToNamed("/home");
      isLoading.value = false;
    }
  }

  postLogin() async {
    try {
      isLoading.value = true;
      var response = await _httpClient.postLogin(
          emailController.text, passwordController.text);
      if (response.isOk) {
        Get.offAndToNamed("/home");
      } else {
        Get.snackbar("Thông báo", "Đăng nhập thất bại");
      }
    } finally {
      isLoading.value = false;
    }
  }
}
