import 'package:flutter/material.dart';
import 'package:mvvm_core_project/constants/app_color.dart';

class AppTextTheme {
  static TextTheme appTextTheme() {
    return const TextTheme(
      headlineLarge: TextStyle(fontSize: 28, color: AppColor.lbSecondary, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
        fontSize: 24,
        color: AppColor.lbSecondary,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        color: AppColor.lbSecondary,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        color: AppColor.white,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: AppColor.white,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: AppColor.white,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColor.lbSecondary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColor.lbSecondary,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: AppColor.lbSecondary,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        color: AppColor.lbSecondary,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        color: AppColor.lbSecondary,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        color: AppColor.lbSecondary,
      ),
    );
  }
}
