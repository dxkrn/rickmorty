import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rickmorty/app/routes/app_pages.dart';
import 'package:rickmorty/theme.dart';
import 'package:rickmorty/widgets/appbar.dart';
import 'package:rickmorty/widgets/character_card.dart';
import 'package:rickmorty/widgets/scaffold_body.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);
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
              child: GridView.count(
                padding: EdgeInsets.only(top: 120.w, bottom: 40.w),
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
                  // CharacterCard(withMargin: false),
                  // CharacterCard(withMargin: false),
                  // CharacterCard(withMargin: false),
                  // CharacterCard(withMargin: false),
                  // CharacterCard(withMargin: false),
                  // CharacterCard(withMargin: false),
                  // CharacterCard(withMargin: false),
                  // CharacterCard(withMargin: false),
                  // CharacterCard(withMargin: false),
                ],
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
