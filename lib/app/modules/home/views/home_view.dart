import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rickmorty/app/routes/app_pages.dart';
import 'package:rickmorty/theme.dart';
import 'package:rickmorty/widgets/appbar.dart';
import 'package:rickmorty/widgets/character_card.dart';
import 'package:rickmorty/widgets/scaffold_body.dart';
import 'package:rickmorty/widgets/space.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final advancedDrawerController = AdvancedDrawerController();

    return AdvancedDrawer(
      drawer: const Drawer(),
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        color: primaryColor,
      ),
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.r)),
      ),
      child: Scaffold(
        body: ScaffoldBody(
          child: SizedBox(
            width: deviceWidth,
            height: deviceHeight,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                  ),
                  child: ListView(
                    children: [
                      SpaceVertical(height: 80.w),
                      SizedBox(
                        width: deviceWidth,
                        child: Image.asset(
                            'lib/assets/images/logo-rick-morty.png'),
                      ),
                      SpaceVertical(height: 24.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: (deviceWidth - 48.w) / 2 - 8.w,
                            child: const Column(
                              children: [
                                CharacterCard(),
                                CharacterCard(),
                                CharacterCard(),
                                CharacterCard(),
                                CharacterCard(),
                                CharacterCard(),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: (deviceWidth - 48.w) / 2 - 8.w,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.DISCOVER);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 64.w,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    margin: EdgeInsets.only(bottom: 16.w),
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(64.r),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Search',
                                          style: regulerTextStyle,
                                        ),
                                        SizedBox(
                                          width: 44.w,
                                          height: 44.w,
                                          child: Image.asset(
                                              'lib/assets/icons/icon-search-circle.png'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Column(
                                  children: [
                                    CharacterCard(),
                                    CharacterCard(),
                                    CharacterCard(),
                                    CharacterCard(),
                                    CharacterCard(),
                                    CharacterCard(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Appbar(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          advancedDrawerController.showDrawer();
                        },
                        child: SizedBox(
                          width: 32.w,
                          height: 32.w,
                          child: Image.asset('lib/assets/icons/icon-menu.png'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.FAVORITE);
                        },
                        child: SizedBox(
                          width: 32.w,
                          height: 32.w,
                          child:
                              Image.asset('lib/assets/icons/icon-favorite.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Drawer extends StatelessWidget {
  const Drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth,
      height: deviceHeight,
      padding: EdgeInsets.symmetric(vertical: 100.w, horizontal: 24.w),
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200.r),
                  border: Border.all(
                    width: 4.w,
                    color: accentColor,
                  ),
                  image: const DecorationImage(
                    image: AssetImage(
                      'lib/assets/images/profile-yellow.png',
                    ),
                  ),
                ),
              ),
              Text(
                'Dicky Khurn',
                style: boldTextStyle.copyWith(fontSize: 20.sp),
              ),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child: Image.asset('lib/assets/icons/icon-account.png'),
                      ),
                      SpaceHorizontal(width: 8.w),
                      Text(
                        'Account',
                        style: regulerTextStyle.copyWith(fontSize: 20.sp),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child:
                            Image.asset('lib/assets/icons/icon-language.png'),
                      ),
                      SpaceHorizontal(width: 8.w),
                      Text(
                        'Language',
                        style: regulerTextStyle.copyWith(fontSize: 20.sp),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child: Image.asset('lib/assets/icons/icon-layout.png'),
                      ),
                      SpaceHorizontal(width: 8.w),
                      Text(
                        'Layout',
                        style: regulerTextStyle.copyWith(fontSize: 20.sp),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.ABOUT);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child: Image.asset('lib/assets/icons/icon-about.png'),
                      ),
                      SpaceHorizontal(width: 8.w),
                      Text(
                        'About',
                        style: regulerTextStyle.copyWith(fontSize: 20.sp),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child: Image.asset(
                            'lib/assets/icons/icon-privacypolicy.png'),
                      ),
                      SpaceHorizontal(width: 8.w),
                      Text(
                        'Privacy Policy',
                        style: regulerTextStyle.copyWith(fontSize: 20.sp),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child: Image.asset('lib/assets/icons/icon-terms.png'),
                      ),
                      SpaceHorizontal(width: 8.w),
                      Text(
                        'Terms & Cond.',
                        style: regulerTextStyle.copyWith(fontSize: 20.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              exit(0);
            },
            child: Text(
              'Exit Application',
              style: semiboldTextStyle.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: accentColor),
            ),
          ),
        ],
      ),
    );
  }
}
