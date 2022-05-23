import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamo/resources/resources.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle primaryTextStyle = GoogleFonts.poppins(
    color: AppColors.primaryTextColor,
  );
  static TextStyle secondTextStyle = GoogleFonts.poppins(
    color: AppColors.secondTextColor,
  );
  static TextStyle priceTextStyle = GoogleFonts.poppins(
    color: AppColors.priceColor,
  );
  static TextStyle purpleTextStyle = GoogleFonts.poppins(
    color: AppColors.primaryColor,
  );
  static TextStyle blackTextStyle = GoogleFonts.poppins(
    color: AppColors.blackColor,
  );

  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
}
