import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

class HomeController extends GetxController {
  RxInt pageIndex = 0.obs;

  setTabs(index) {
    pageIndex.value = index;
    update();
  }
}
