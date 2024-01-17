import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickmorty/theme.dart';
import 'package:rickmorty/widgets/space.dart';
import 'package:shimmer/shimmer.dart';

class CharacterCardShimmerSmall extends StatelessWidget {
  const CharacterCardShimmerSmall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: secondaryColor,
      highlightColor: secondaryLightColor,
      child: Container(
        width: ((deviceWidth - 48.w) / 2 - 8.w),
        height: 4 / 3 * ((deviceWidth - 48.w) / 2 - 8.w),
        margin: EdgeInsets.only(bottom: 16.w),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(32.r),
        ),
      ),
    );
  }
}

class CharacterCardShimmerLarge extends StatelessWidget {
  const CharacterCardShimmerLarge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: secondaryColor,
      highlightColor: secondaryLightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: deviceWidth - 48.w,
            height: deviceWidth - 48.w,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(32.r),
            ),
          ),
          SpaceVertical(height: 8.r),
          Container(
            width: 220.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          SpaceVertical(height: 8.w),
          Container(
            width: 100.w,
            height: 24.w,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          SpaceVertical(height: 40.w),
        ],
      ),
    );
  }
}
