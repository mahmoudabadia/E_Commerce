import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static TextStyle inter({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // Large Styles (20px - 24px)
  static final TextStyle semiBold24White = inter(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );

  static final TextStyle semiBold20Blue = inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.blueColor,
  );

  static final TextStyle medium20White = inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );

  // Medium Styles (16px - 18px)
  static final TextStyle semiBold18White = inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );

  static final TextStyle medium18Blue = inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.blueColor,
  );

  static final TextStyle medium18lightBlue = inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.lightBlueColor,
  );

  static final TextStyle regular18gray = inter(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: AppColors.lightBlack,
  );

  static final TextStyle regular18Blue = inter(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: AppColors.blueColor,
  );

  static final TextStyle semiBold16Blue = inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.blueColor,
  );

  static final TextStyle regular16White = inter(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: AppColors.whiteColor,
  );

  // Small Styles (12px - 14px)
  static final TextStyle medium14White = inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );

  static final TextStyle medium14Blue = inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.blueColor,
  );

  static final TextStyle regular14Blue = inter(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.blueColor,
  );

  static final TextStyle regular14lightBlue = inter(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.lightBlueColor,
  );

  static final TextStyle description = inter(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.discountTextColor,
  );

  static final TextStyle regular12white = inter(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: AppColors.whiteColor,
  );
}