import 'package:flutter/material.dart';
import 'package:gvb_charge/pages/add_money/add_money_controller.dart';
import 'package:get/get.dart';
import 'package:gvb_charge/share/c_button.dart';
import 'package:gvb_charge/share/text_style.dart';
import 'package:number_mask/number_mask.dart';

import '../../share/appbar.dart';
import '../../share/text_form_field.dart';

class AddMoneyPage extends GetView<AddMoneyController> {
  const AddMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppbar("Nộp tiền"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CTextFormField(
                textControllor: controller.textController,
                hintText: "Nộp tiền",
                onChanged: (s) {},
                listNumberFormat: [
                  NumberMask(pattern: '###.###.###'),
                ],
              ),
              const SizedBox(height: 5),
              Text("Lưu ý: Nộp tiền thành công sẽ không hoàn trả.",
                  style: xSmallTextStyle),
              const SizedBox(height: 15),
              buttonDefault("Nộp tiền", () {}),
            ]),
          ),
        ),
      ),
    );
  }
}
