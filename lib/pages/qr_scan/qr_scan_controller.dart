import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QRScanController>(() => QRScanController());
  }
}

class QRScanController extends GetxController {
  MobileScannerController cameraController = MobileScannerController();
  
}
