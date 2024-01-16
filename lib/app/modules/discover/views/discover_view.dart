import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rickmorty/theme.dart';
import 'package:rickmorty/widgets/appbar.dart';
import 'package:rickmorty/widgets/character_card.dart';
import 'package:rickmorty/widgets/scaffold_body.dart';
import 'package:rickmorty/widgets/space.dart';

import '../controllers/discover_controller.dart';

class DiscoverView extends GetView<DiscoverController> {
  const DiscoverView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    Container(
                      width: double.infinity,
                      height: 64.w,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      margin: EdgeInsets.only(bottom: 16.w),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(64.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: deviceWidth - 120.w,
                            height: 32.w,
                            alignment: Alignment.centerLeft,
                            child: TextField(
                              textInputAction: TextInputAction.search,
                              onSubmitted: (value) {},
                              textAlignVertical: TextAlignVertical.center,
                              style: regulerTextStyle,
                              cursorColor: accentColor,
                              autofocus: true,
                              autocorrect: false,
                              enableSuggestions: false,
                              decoration: InputDecoration(
                                hintStyle: lightTextStyle,
                                isCollapsed: true,
                                hintText: 'Try "Smith"',
                                border: InputBorder.none,
                              ),
                            ),
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
                    SpaceVertical(height: 16.w),
                    Text(
                      'Result for "Battleground"',
                      style: regulerTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SpaceVertical(height: 16.w),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Image.asset('lib/assets/images/no-item-found.png'),
                    ),
                    SizedBox(
                      width: deviceWidth - 48.w,
                      height: 2000.w,
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.w,
                        childAspectRatio: 3 / 4,
                        children: const [
                          // CharacterCard(withMargin: false),
                          // CharacterCard(withMargin: false),
                          // CharacterCard(withMargin: false),
                          // CharacterCard(withMargin: false),
                          // CharacterCard(withMargin: false),
                        ],
                      ),
                    )
                  ],
                ),
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
                      'Discover',
                      style: semiboldTextStyle.copyWith(fontSize: 24.sp),
                    ),
                    SizedBox(
                      width: 32.w,
                      height: 32.w,
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
