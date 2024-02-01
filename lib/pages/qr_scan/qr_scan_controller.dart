import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<QRScanController>(() => QRScanController()),
    ];
  }
}

class QRScanController extends GetxController {
  MobileScannerController cameraController = MobileScannerController();
}
