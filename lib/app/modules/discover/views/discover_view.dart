// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rickmorty/app/data/storage/get_storage.dart';
import 'package:rickmorty/app/routes/app_pages.dart';
import 'package:rickmorty/theme.dart';
import 'package:rickmorty/widgets/appbar.dart';
import 'package:rickmorty/widgets/scaffold_body.dart';
import 'package:rickmorty/widgets/shimmer.dart';
import 'package:rickmorty/widgets/space.dart';

import '../controllers/discover_controller.dart';

class DiscoverView extends GetView<DiscoverController> {
  const DiscoverView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DiscoverController discoverC = Get.put(DiscoverController());

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
                child: Obx(
                  () => ListView(
                    controller: discoverC.scrollController,
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
                                controller: discoverC.searchInputController,
                                textInputAction: TextInputAction.search,
                                onSubmitted: (value) {
                                  discoverC.searchCharacter();
                                },
                                textAlignVertical: TextAlignVertical.center,
                                style: regulerTextStyle,
                                cursorColor: accentColor,
                                autofocus: discoverC.autoFocus.value,
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
                            GestureDetector(
                              onTap: () {
                                discoverC.searchCharacter();
                              },
                              child: SizedBox(
                                width: 44.w,
                                height: 44.w,
                                child: Image.asset(
                                    'lib/assets/icons/icon-search-circle.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SpaceVertical(height: 16.w),
                      discoverC.searchInputController.text != ''
                          ? Text(
                              'Result for "${discoverC.searchInputController.text}"',
                              style: regulerTextStyle,
                              textAlign: TextAlign.center,
                            )
                          : const SizedBox(),
                      SpaceVertical(height: 16.w),
                      discoverC.totalItemsfound.value == 0
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Image.asset(
                                  'lib/assets/images/no-item-found.png'),
                            )
                          : globalStorage.read('layoutStyle') == 'grid'
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: (deviceWidth - 48.w) / 2 - 8.w,
                                      child: Column(
                                        children: discoverC.isLoading.value
                                            ? [
                                                const CharacterCardShimmerSmall(),
                                                const CharacterCardShimmerSmall(),
                                                const CharacterCardShimmerSmall(),
                                              ]
                                            : discoverC
                                                .characterCardListLeft.value,
                                      ),
                                    ),
                                    SizedBox(
                                      width: (deviceWidth - 48.w) / 2 - 8.w,
                                      child: Column(
                                        children: discoverC.isLoading.value
                                            ? [
                                                const CharacterCardShimmerSmall(),
                                                const CharacterCardShimmerSmall(),
                                                const CharacterCardShimmerSmall(),
                                              ]
                                            : discoverC
                                                .characterCardListRight.value,
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: discoverC.isLoading.value
                                      ? [
                                          const CharacterCardShimmerLarge(),
                                          const CharacterCardShimmerLarge(),
                                        ]
                                      : discoverC.characterCardList.value,
                                ),
                    ],
                  ),
                ),
              ),
              Appbar(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.HOME);
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
