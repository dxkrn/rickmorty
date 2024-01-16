import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickmorty/theme.dart';
import 'package:rickmorty/widgets/space.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    this.withMargin = true,
  });

  final bool withMargin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: ((deviceWidth - 48.w) / 2 - 8.w),
        height: 4 / 3 * ((deviceWidth - 48.w) / 2 - 8.w),
        margin: EdgeInsets.only(bottom: withMargin ? 16.r : 0),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.r),
                topRight: Radius.circular(32.r),
              ),
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset('lib/assets/images/character-1.png'),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Rick Sanchez',
                    style: boldTextStyle,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Human • Male',
                    style: regulerTextStyle.copyWith(
                      fontSize: 12.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                SpaceVertical(height: 8.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
