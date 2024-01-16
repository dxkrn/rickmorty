import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rickmorty/theme.dart';
import 'package:rickmorty/widgets/appbar.dart';
import 'package:rickmorty/widgets/scaffold_body.dart';
import 'package:rickmorty/widgets/space.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldBody(
        child: SizedBox(
          width: deviceWidth,
          height: deviceHeight,
          child: Stack(
            children: [
              ListView(
                children: [
                  SpaceVertical(height: 80.w),
                  SizedBox(
                    height: deviceWidth,
                    child: Image.asset('lib/assets/images/profile-2.png'),
                  ),
                  SpaceVertical(height: 8.w),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'DICKY KHURNIAWAN',
                          style: boldTextStyle.copyWith(
                            fontSize: 24.sp,
                          ),
                        ),
                        SpaceVertical(height: 24.w),
                        Text(
                          "Hi, I am an Undergraduate Student of Informatics Engineering Education at Yogyakarta State University. I have interest in UI/UX Design and Mobile Application Development since 2021. I'd like to meet with clients, discuss to understand their needs, and provide solutions for their problems. I am ambitious in academics and like to participating in various competitions to become a winner.",
                          style: regulerTextStyle,
                          textAlign: TextAlign.justify,
                        ),
                        SpaceVertical(height: 24.w),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                if (!await launchUrl(Uri.parse(
                                    'https://www.instagram.com/dxkrn'))) {
                                  throw Exception('Could not launch URL');
                                }
                              },
                              child: Container(
                                width: 40.w,
                                height: 40.w,
                                margin: EdgeInsets.only(right: 16.w),
                                child: Image.asset(
                                    'lib/assets/icons/icon-instagram.png'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (!await launchUrl(Uri.parse(
                                    'https://www.linkedin.com/in/dicky-khurniawan-a0057a2a5'))) {
                                  throw Exception('Could not launch URL');
                                }
                              },
                              child: Container(
                                width: 40.w,
                                height: 40.w,
                                margin: EdgeInsets.only(right: 16.w),
                                child: Image.asset(
                                    'lib/assets/icons/icon-linkedin.png'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (!await launchUrl(
                                    Uri.parse('https://github.com/dxkrn'))) {
                                  throw Exception('Could not launch URL');
                                }
                              },
                              child: Container(
                                width: 40.w,
                                height: 40.w,
                                margin: EdgeInsets.only(right: 16.w),
                                child: Image.asset(
                                    'lib/assets/icons/icon-github.png'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SpaceVertical(height: 100.w),
                ],
              ),
              Appbar(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SizedBox(
                        width: 32.w,
                        height: 32.w,
                        child:
                            Image.asset('lib/assets/icons/icon-arrow-left.png'),
                      ),
                    ),
                    Text(
                      'About',
                      style: semiboldTextStyle.copyWith(fontSize: 24.sp),
                    ),
                    SizedBox(
                      width: 32.w,
                      height: 32.w,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 24.w,
                right: 24.w,
                child: GestureDetector(
                  onTap: () async {
                    if (!await launchUrl(
                        Uri.parse('https://dickykhurniawan.vercel.app'))) {
                      throw Exception('Could not launch URL');
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 16.w,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(64.r),
                    ),
                    child: Text(
                      'See Portfolio',
                      style: mediumTextStyle.copyWith(
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
