import 'package:flutter/material.dart';

Widget SafeAreaLoading(bool isLoading, Widget widget) {
  return isLoading
      ? const Center(child: CircularProgressIndicator())
      : SafeArea(child: widget);
}
