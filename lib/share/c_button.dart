import 'package:flutter/cupertino.dart';
import 'package:gvb_charge/share/colors.dart';
import 'package:gvb_charge/share/text_style.dart';

import 'pressable.dart';

Widget buttonDefault(String text, Function onTap) {
  return Pressable(
    onPress: () async {
      await onTap.call();
    },
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(25)),
      child: Center(
        child: Text(
          text,
          style: smallTextStyle.copyWith(color: white),
        ),
      ),
    ),
  );
}
