import 'package:get/get.dart';
import 'package:gvb_charge/pages/home/home_controller.dart';

import '../../service/http_client.dart';
import '../../share/c_getx_controller.dart';

class PickTimeBookingBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<PickTimeBookingController>(
          () => PickTimeBookingController(Get.find()))
    ];
  }
}

class PickTimeBookingController extends GetXControllerCustom {
  RxList<int> listTimeBooking = RxList([1, 2, 3, 4, 5]);

  RxInt timeBookingCurent = RxInt(0);
  final HttpClient _httpClient;

  PickTimeBookingController(this._httpClient);
  onChangeItemTime(int time) {
    timeBookingCurent.value = time;
  }

  onChargingON() async {
    try {
      isLoading.value = true;
      if (timeBookingCurent.value == 0) {
        Get.snackbar("Thông báo", "Chọn thời gian sạc");
        return;
      }
      var result = await _httpClient.postBookingInsert(
          Get.arguments, timeBookingCurent.value);
      if (result.isOk) {
        Get.back(result: true);
        HomeController secondController = Get.find<HomeController>();
        secondController.setTabs(1);
        secondController.getListHistoryBooking(1);
      } else {
        Get.snackbar("Thông báo", result.body?.message ?? "");
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }
}
