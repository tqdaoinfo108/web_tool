// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gvb_charge/share/colors.dart';
import 'package:gvb_charge/share/text_style.dart';

class MultilineTextField extends StatelessWidget {
  final TextEditingController? textControllor;
  final String? hintText;
  final String? initialValue;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final bool? showCursor;
  void Function()? onTap;
  final String? Function(String?)? validator;
  void Function(String?)? onSaved;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final int? minLines;

  MultilineTextField(
      {super.key,
      this.textControllor,
      this.hintText,
      this.initialValue,
      this.keyboardType,
      this.textInputAction,
      this.showCursor,
      this.onTap,
      this.validator,
      this.onSaved,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.readOnly = false,
      this.onChanged,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.minLines});

  final kInputFocusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: primary, width: 1));

  final kInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFFE2E4EA), width: 1));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textControllor,
      maxLines: null,
      minLines: minLines,
      decoration: InputDecoration(
        hintStyle: hintTextStyle,
        filled: true,
        fillColor: fillColor,
        focusColor: primary,
        hintTextDirection: TextDirection.ltr,
        alignLabelWithHint: true,
        border: kInputBorder,
        enabledBorder: kInputBorder,
        focusedBorder: kInputFocusBorder,
        contentPadding: EdgeInsets.all(18),
        // prefixIcon: Padding(
        //    padding: REdgeInsets.symmetric(vertical: 17.h, horizontal: 14.w),
        //   child: prefixIcon,
        // ),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      style: inputTextStyle,
      initialValue: initialValue,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      readOnly: readOnly,
      showCursor: showCursor,
      onTap: onTap,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
