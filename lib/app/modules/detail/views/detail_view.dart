import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rickmorty/app/routes/app_pages.dart';
import 'package:rickmorty/theme.dart';
import 'package:rickmorty/widgets/appbar.dart';
import 'package:rickmorty/widgets/scaffold_body.dart';
import 'package:rickmorty/widgets/space.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
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
                  SizedBox(
                    width: deviceWidth,
                    height: deviceWidth,
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent],
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: Image.asset('lib/assets/images/character-1.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const FavoriteLongButton(),
                          ],
                        ),
                        SizedBox(
                          width: deviceWidth - 48.w,
                          child: Text(
                            'Rick Sanchez',
                            style: extraboldTextStyle.copyWith(fontSize: 32.sp),
                          ),
                        ),
                        SpaceVertical(height: 16.w),
                        SizedBox(
                          width: deviceWidth - 48.w,
                          child: Text(
                            'Character Detail',
                            style: boldTextStyle.copyWith(fontSize: 20.sp),
                          ),
                        ),
                        SpaceVertical(height: 8.w),
                        Container(
                          decoration: BoxDecoration(
                              color: accentLightColor,
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Row(
                            children: [
                              Container(
                                width: (deviceWidth - 48.2) / 2,
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  color: accentLightColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.r),
                                  ),
                                ),
                                child: Text(
                                  'Species',
                                  style: boldTextStyle.copyWith(
                                    color: fontDarkColor,
                                  ),
                                ),
                              ),
                              Container(
                                width: (deviceWidth - 48.2) / 2,
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  color: accentColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16.r),
                                  ),
                                ),
                                child: Text(
                                  'Human',
                                  style: mediumTextStyle.copyWith(
                                    color: fontDarkColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: accentLightColor,
                          child: Row(
                            children: [
                              Container(
                                width: (deviceWidth - 48.2) / 2,
                                padding: EdgeInsets.all(8.w),
                                decoration: const BoxDecoration(
                                  color: Color(0xffECEFC0),
                                ),
                                child: Text(
                                  'Gender',
                                  style: boldTextStyle.copyWith(
                                    color: fontDarkColor,
                                  ),
                                ),
                              ),
                              Container(
                                width: (deviceWidth - 48.2) / 2,
                                padding: EdgeInsets.all(8.w),
                                decoration: const BoxDecoration(
                                  color: Color(0xffDEE39B),
                                ),
                                child: Text(
                                  'Male',
                                  style: mediumTextStyle.copyWith(
                                    color: fontDarkColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: accentLightColor,
                          child: Row(
                            children: [
                              Container(
                                width: (deviceWidth - 48.2) / 2,
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  color: accentLightColor,
                                ),
                                child: Text(
                                  'Origin',
                                  style: boldTextStyle.copyWith(
                                    color: fontDarkColor,
                                  ),
                                ),
                              ),
                              Container(
                                width: (deviceWidth - 48.2) / 2,
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  color: accentColor,
                                ),
                                child: Text(
                                  'Earth (C-137)',
                                  style: mediumTextStyle.copyWith(
                                    color: fontDarkColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: accentLightColor,
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Row(
                            children: [
                              Container(
                                width: (deviceWidth - 48.2) / 2,
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  color: const Color(0xffECEFC0),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16.r)),
                                ),
                                child: Text(
                                  'Location',
                                  style: boldTextStyle.copyWith(
                                    color: fontDarkColor,
                                  ),
                                ),
                              ),
                              Container(
                                width: (deviceWidth - 48.2) / 2,
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                    color: const Color(0xffDEE39B),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(16.r))),
                                child: Text(
                                  'Citadel of Ricks',
                                  style: mediumTextStyle.copyWith(
                                    color: fontDarkColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Appbar(
                withBackground: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SizedBox(
                        width: 40.w,
                        height: 40.w,
                        child: Image.asset(
                            'lib/assets/icons/icon-arrow-left-circle.png'),
                      ),
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

class FavoriteLongButton extends StatefulWidget {
  const FavoriteLongButton({
    super.key,
  });

  @override
  State<FavoriteLongButton> createState() => _FavoriteLongButtonState();
}

class _FavoriteLongButtonState extends State<FavoriteLongButton> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFav = !isFav;
        });
      },
      child: Container(
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
            Text(
              isFav ? 'Remove from Fav' : 'Add to Fav',
              style: regulerTextStyle,
            ),
            SpaceHorizontal(width: 8.w),
            SizedBox(
              width: 44.w,
              height: 44.w,
              child: Image.asset(isFav
                  ? 'lib/assets/icons/icon-favorite-circle-active.png'
                  : 'lib/assets/icons/icon-favorite-circle-inactive.png'),
            ),
          ],
        ),
      ),
    );
  }
}
