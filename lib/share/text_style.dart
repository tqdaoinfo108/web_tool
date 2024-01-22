import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gvb_charge/share/colors.dart';

TextStyle textLarge({isBold = true}) => TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 16,
    color: black,
    fontWeight: FontWeight.bold);

TextStyle textLarge20({isBold = true}) => TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 20,
    color: mainFontColor,
    fontWeight: FontWeight.bold);

TextStyle textNormal({isBold = false, Color color = black}) => TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 14,
    color: color,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal);

TextStyle textSmall({isBold = false, Color color = black}) => TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 12,
    color: color,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal);
