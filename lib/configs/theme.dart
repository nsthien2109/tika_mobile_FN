import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF304FFE);
  static const white = Color(0xFFFFFFFF);
  static const red = Color(0xFFFF7272);
  static const yellow = Color(0xFFFBC02D);
  static const black = Color(0xFF000000);
  static const blackLighter = Color(0xFF515151);
  static const greyLighter = Color(0xFFAAAAAA);
  static const greyDarker = Color(0xFF4F4F4F);
  static const background = Color(0xFFF6F9FF);
  static const placeholderImageColor = Color(0xFFEEEEEE);
  static const shimmerColor = Color(0xFFEEEEEE);
  static const shimmerColorDarker = Color(0xFF9E9E9E);
}

class TikaToast {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showToast(context,toastText) {
    final snackBar = SnackBar(
        elevation: 3,
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        content: Text(toastText)
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
