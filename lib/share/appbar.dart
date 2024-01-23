import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gvb_charge/share/colors.dart';
import 'package:gvb_charge/share/text_style.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: non_constant_identifier_names
Widget CAppbar(String title) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: white,
    leadingWidth: 100.w,
    title: Text(title, style: mediumTextStyle),
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: arrowBackColor,
        size: 20.r,
      ),
    ),
  );
}
