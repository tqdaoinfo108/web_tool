import 'package:flutter/material.dart';

Widget SafeAreaLoading(bool isLoading, Widget widget) {
  return isLoading
      ? const Expanded(
          child: Center(child: CircularProgressIndicator()),
        )
      : SafeArea(child: widget);
}
