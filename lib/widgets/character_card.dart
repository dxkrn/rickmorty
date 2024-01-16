import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rickmorty/app/models/character_model.dart';
import 'package:rickmorty/app/routes/app_pages.dart';
import 'package:rickmorty/theme.dart';
import 'package:rickmorty/widgets/space.dart';

class CharacterCardSmall extends StatelessWidget {
  const CharacterCardSmall({
    super.key,
    this.withMargin = true,
    required this.character,
  });

  final bool withMargin;
  final Character character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL);
      },
      child: Container(
        width: ((deviceWidth - 48.w) / 2 - 8.w),
        height: 4 / 3 * ((deviceWidth - 48.w) / 2 - 8.w),
        margin: EdgeInsets.only(bottom: withMargin ? 16.w : 0),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Stack(
          children: [
            Column(
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
                      ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.network(
                        character.image ?? 'lib/assets/images/character-1.png'),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        character.name ?? '',
                        style: boldTextStyle,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        '${character.species} • ${character.gender}',
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
            Positioned(
              top: 10.w,
              right: 10.w,
              child: const PrimaryFavoriteButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class CharacterCardLarge extends StatelessWidget {
  const CharacterCardLarge({
    super.key,
    this.withMargin = true,
    required this.character,
  });

  final bool withMargin;
  final Character character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL);
      },
      child: Container(
        width: deviceWidth - 48.w,
        margin: EdgeInsets.only(bottom: 40.w),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: deviceWidth - 48.w,
                  height: deviceWidth - 48.w,
                  child: ClipRRect(
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
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: Image.network(
                        character.image ?? 'lib/assets/images/character-1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(
                  character.name ?? '',
                  style: extraboldTextStyle.copyWith(fontSize: 24.sp),
                ),
                Text(
                  '${character.species} • ${character.gender}',
                  style: regulerTextStyle,
                ),
              ],
            ),
            Positioned(
              top: 10.w,
              right: 10.w,
              child: const PrimaryFavoriteButton(
                width: 56,
                height: 56,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryFavoriteButton extends StatefulWidget {
  const PrimaryFavoriteButton({super.key, this.width = 40, this.height = 40});

  final double width, height;

  @override
  State<PrimaryFavoriteButton> createState() => _PrimaryFavoriteButtonState();
}

class _PrimaryFavoriteButtonState extends State<PrimaryFavoriteButton> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFav = !isFav;
        });
      },
      child: SizedBox(
        width: widget.width.w,
        height: widget.height.w,
        child: Image.asset(isFav
            ? 'lib/assets/icons/icon-favorite-primary-active.png'
            : 'lib/assets/icons/icon-favorite-primary-inactive.png'),
      ),
    );
  }
}
