import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddMoneyBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<AddMoneyController>(() => AddMoneyController()),
    ];
  }
}

class AddMoneyController extends GetxController {
  TextEditingController textController = TextEditingController();
  RxString moneyString = RxString("");

}
