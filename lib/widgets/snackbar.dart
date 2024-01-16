import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rickmorty/theme.dart';

class CustomSnackbar {
  final String title;
  final String message;

  const CustomSnackbar({
    required this.title,
    required this.message,
  });

  static show(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      maxWidth: deviceWidth - 48.w,
      margin: EdgeInsets.only(top: 24.w, bottom: 24.w),
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
      backgroundColor: secondaryColor.withOpacity(0.7),
      borderWidth: 1.w,
      borderColor: secondaryDarkColor.withOpacity(0.5),
      borderRadius: 100.r,
      colorText: fontLightColor,
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/assets/icons/icon-launcher.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
