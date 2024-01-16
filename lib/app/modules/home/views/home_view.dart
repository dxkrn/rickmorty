import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
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
    return Scaffold(
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
                      child:
                          Image.asset('lib/assets/images/logo-rick-morty.png'),
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
                                onTap: () {},
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
                      onTap: () {},
                      child: SizedBox(
                        width: 32.w,
                        height: 32.w,
                        child: Image.asset('lib/assets/icons/icon_menu.png'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        width: 32.w,
                        height: 32.w,
                        child:
                            Image.asset('lib/assets/icons/icon_favorite.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
