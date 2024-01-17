// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickmorty/app/data/global/global.dart';
import 'package:styled_text/styled_text.dart';
import 'package:get/get.dart';
import 'package:rickmorty/app/data/storage/get_storage.dart';
import 'package:rickmorty/app/routes/app_pages.dart';
import 'package:rickmorty/theme.dart';
import 'package:rickmorty/widgets/appbar.dart';
import 'package:rickmorty/widgets/scaffold_body.dart';
import 'package:rickmorty/widgets/shimmer.dart';
import 'package:rickmorty/widgets/space.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final advancedDrawerController = AdvancedDrawerController();
    final HomeController homeC = Get.put(HomeController());

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
                    controller: homeC.scrollController,
                    children: [
                      SpaceVertical(height: 80.w),
                      SizedBox(
                        width: deviceWidth,
                        child: Image.asset(
                            'lib/assets/images/logo-rick-morty.png'),
                      ),
                      SpaceVertical(height: 24.w),
                      Obx(
                        () => globalStorage.read('layoutStyle') == 'grid'
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: (deviceWidth - 48.w) / 2 - 8.w,
                                    child: Column(
                                      children: homeC.characterCardListLeft
                                              .value.isNotEmpty
                                          ? homeC.characterCardListLeft.value
                                          : [
                                              const CharacterCardShimmerSmall(),
                                              const CharacterCardShimmerSmall(),
                                              const CharacterCardShimmerSmall(),
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
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            margin:
                                                EdgeInsets.only(bottom: 16.w),
                                            decoration: BoxDecoration(
                                              color: secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(64.r),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                        Column(
                                          children: homeC.characterCardListRight
                                                  .value.isNotEmpty
                                              ? homeC
                                                  .characterCardListRight.value
                                              : [
                                                  const CharacterCardShimmerSmall(),
                                                  const CharacterCardShimmerSmall(),
                                                  const CharacterCardShimmerSmall(),
                                                ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.DISCOVER);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 64.w,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      margin: EdgeInsets.only(bottom: 16.w),
                                      decoration: BoxDecoration(
                                        color: secondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(64.r),
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
                                  SpaceVertical(height: 24.w),
                                  Column(
                                    children:
                                        homeC.characterCardList.value.isNotEmpty
                                            ? homeC.characterCardList.value
                                            : [
                                                const CharacterCardShimmerLarge(),
                                                const CharacterCardShimmerLarge(),
                                              ],
                                  ),
                                ],
                              ),
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
                          Get.offAndToNamed(Routes.FAVORITE);
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
                onTap: () {
                  Get.dialog(
                    SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Container(
                              width: deviceWidth - 48.w,
                              padding: EdgeInsets.all(24.w),
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(32.r),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Language 🌏',
                                    style: extraboldTextStyle.copyWith(
                                      fontSize: 20.w,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SpaceVertical(height: 16.w),
                                  Container(
                                    width: double.infinity,
                                    height: 1.w,
                                    color: accentColor,
                                  ),
                                  SpaceVertical(height: 16.w),
                                  Text(
                                    'English',
                                    style: extraboldTextStyle,
                                  ),
                                  SpaceVertical(height: 8.w),
                                  Text(
                                    'Indonesia (Soon)',
                                    style: regulerTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
                onTap: () {
                  Get.dialog(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Container(
                            width: deviceWidth - 48.w,
                            padding: EdgeInsets.all(24.w),
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(32.r),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Layout',
                                  style: extraboldTextStyle.copyWith(
                                      fontSize: 20.w),
                                ),
                                SpaceVertical(height: 24.w),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        globalStorage.write(
                                            'layoutStyle', 'grid');
                                        Get.offAllNamed(Routes.HOME);
                                      },
                                      child: Container(
                                        width: (deviceWidth - 96.w) / 2 - 8.w,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 16.w,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(32.r),
                                          border: Border.all(
                                              width: globalStorage.read(
                                                          'layoutStyle') ==
                                                      'grid'
                                                  ? 4.w
                                                  : 0.w,
                                              color: accentColor),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: (deviceWidth - 96.w) / 2 -
                                                  24.w,
                                              height: (deviceWidth - 96.w) / 2 -
                                                  24.w,
                                              child: Image.asset(
                                                'lib/assets/icons/icon-grid.png',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        globalStorage.write(
                                            'layoutStyle', 'list');
                                        Get.offAllNamed(Routes.HOME);
                                      },
                                      child: Container(
                                        width: (deviceWidth - 96.w) / 2 - 8.w,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 16.w,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(32.r),
                                          border: Border.all(
                                              width: globalStorage.read(
                                                          'layoutStyle') ==
                                                      'list'
                                                  ? 4.w
                                                  : 0.w,
                                              color: accentColor),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: (deviceWidth - 96.w) / 2 -
                                                  24.w,
                                              height: (deviceWidth - 96.w) / 2 -
                                                  24.w,
                                              child: Image.asset(
                                                'lib/assets/icons/icon-list.png',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
                onTap: () {
                  Get.dialog(
                    SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Container(
                              width: deviceWidth - 48.w,
                              height: deviceWidth,
                              padding: EdgeInsets.all(24.w),
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(32.r),
                              ),
                              child: ListView(
                                children: [
                                  Text(
                                    'Privacy Policy',
                                    style: extraboldTextStyle.copyWith(
                                      fontSize: 24.w,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SpaceVertical(height: 24.w),
                                  StyledText(
                                    text: privacyPolicyText,
                                    style: regulerTextStyle,
                                    tags: {
                                      'b': StyledTextTag(
                                        style: boldTextStyle,
                                      ),
                                      'dot': StyledTextIconTag(
                                        Icons.circle,
                                        size: 12.w,
                                      ),
                                      'i': StyledTextTag(
                                        style: regulerTextStyle.copyWith(
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      'blue': StyledTextTag(
                                        style: boldTextStyle.copyWith(
                                          color: tertiaryLightColor,
                                        ),
                                      ),
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
                onTap: () {
                  Get.dialog(
                    SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Container(
                              width: deviceWidth - 48.w,
                              height: deviceWidth,
                              padding: EdgeInsets.all(24.w),
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(32.r),
                              ),
                              child: ListView(
                                children: [
                                  Text(
                                    'Terms & Conditions',
                                    style: extraboldTextStyle.copyWith(
                                      fontSize: 24.w,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SpaceVertical(height: 24.w),
                                  StyledText(
                                    text: termsText,
                                    style: regulerTextStyle,
                                    tags: {
                                      'b': StyledTextTag(
                                        style: boldTextStyle,
                                      ),
                                      'dot': StyledTextIconTag(
                                        Icons.circle,
                                        size: 12.w,
                                        color: accentColor,
                                      ),
                                      'i': StyledTextTag(
                                        style: regulerTextStyle.copyWith(
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      'blue': StyledTextTag(
                                        style: boldTextStyle.copyWith(
                                          color: tertiaryLightColor,
                                        ),
                                      ),
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
