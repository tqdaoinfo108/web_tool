import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gvb_charge/share/colors.dart';
import 'package:gvb_charge/share/text_style.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: non_constant_identifier_names
AppBar CAppbar(String title) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: white,
    leadingWidth: 20.w,
    title: Text(title, style: mediumTextStyle),
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: arrowBackColor,
      ),
    ),
  );
}
