import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// NOTE: Colors
// NOTE: Colors - Primary
Color primaryColor = const Color(0xff453C67);
Color primaryDarkColor = const Color(0xff322A4F);
Color primaryLightColor = const Color(0xff655897);

// NOTE: Colors - Secondary
Color secondaryColor = const Color(0xff6D67E4);
Color secondaryDarkColor = const Color(0xff4942D6);
Color secondaryLightColor = const Color(0xff948FFF);

// NOTE: Colors - Tertiary
Color tertiaryColor = const Color(0xff46C2CB);
Color tertiaryDarkColor = const Color(0xff09A7B2);
Color tertiaryLightColor = const Color(0xff73F2FB);

// NOTE: Colors - Accent
Color accentColor = const Color(0xffF2F7A1);
Color accentDarkColor = const Color(0xffE7F053);
Color accentLightColor = const Color(0xffFCFFCB);

// NOTE: Colors - Font
Color fontLightColor = const Color(0xffF2F7A1);
Color fontDarkColor = const Color(0xff453C67);

//NOTE: Typography
TextStyle thinTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w100,
  color: fontLightColor,
  fontSize: 16.sp,
);
TextStyle extralightTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w200,
  color: fontLightColor,
  fontSize: 16.sp,
);
TextStyle lightTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w300,
  color: fontLightColor,
  fontSize: 16.sp,
);
TextStyle regulerTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w400,
  color: fontLightColor,
  fontSize: 16.sp,
);
TextStyle mediumTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: fontLightColor,
  fontSize: 16.sp,
);
TextStyle semiboldTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w600,
  color: fontLightColor,
  fontSize: 16.sp,
);
TextStyle boldTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w700,
  color: fontLightColor,
  fontSize: 16.sp,
);
TextStyle extraboldTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w800,
  color: fontLightColor,
  fontSize: 16.sp,
);
TextStyle blackTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w900,
  color: fontLightColor,
  fontSize: 16.sp,
);

//NOTE : Device Sizes
double deviceWidth = Get.width;
double deviceHeight = Get.height;

//NOTE: Spacer
double spacerExtraSmall = 8.w;
double spacerSmall = 16.w;
double spacerReguler = 24.w;
double spacerMedium = 32.w;
double spacerLarge = 40.w;
double spacerExtraLarge = 48.w;
