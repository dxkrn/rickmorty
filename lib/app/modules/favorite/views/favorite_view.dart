// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rickmorty/app/data/storage/get_storage.dart';
import 'package:rickmorty/app/routes/app_pages.dart';
import 'package:rickmorty/theme.dart';
import 'package:rickmorty/widgets/appbar.dart';
import 'package:rickmorty/widgets/scaffold_body.dart';
import 'package:rickmorty/widgets/space.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FavoriteController favC = Get.put(FavoriteController());

    return Scaffold(
        body: ScaffoldBody(
      child: SizedBox(
        width: deviceWidth,
        height: deviceHeight,
        child: Stack(
          children: [
            Container(
              width: deviceWidth,
              height: deviceHeight,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Obx(
                () => favC.totalFav.value == 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: deviceWidth - 48.w,
                            child: Image.asset(
                                'lib/assets/images/no-favorite-yet.png'),
                          ),
                        ],
                      )
                    : ListView(
                        children: [
                          SpaceVertical(height: 80.w),
                          globalStorage.read('layoutStyle') == 'grid'
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: (deviceWidth - 48.w) / 2 - 8.w,
                                      child: Column(
                                        children:
                                            favC.characterCardListLeft.value,
                                      ),
                                    ),
                                    SizedBox(
                                      width: (deviceWidth - 48.w) / 2 - 8.w,
                                      child: Column(
                                        children:
                                            favC.characterCardListRight.value,
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: favC.characterCardList.value,
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
                      Get.offAndToNamed(Routes.HOME);
                    },
                    child: SizedBox(
                      width: 32.w,
                      height: 32.w,
                      child:
                          Image.asset('lib/assets/icons/icon-arrow-left.png'),
                    ),
                  ),
                  Text(
                    'Favorite',
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
    ));
  }
}
