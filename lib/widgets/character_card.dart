import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rickmorty/app/models/character_model.dart';
import 'package:rickmorty/app/routes/app_pages.dart';
import 'package:rickmorty/theme.dart';
import 'package:rickmorty/widgets/space.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
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

class PrimaryFavoriteButton extends StatefulWidget {
  const PrimaryFavoriteButton({
    super.key,
  });

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
        width: 40.w,
        height: 40.w,
        child: Image.asset(isFav
            ? 'lib/assets/icons/icon-favorite-primary-active.png'
            : 'lib/assets/icons/icon-favorite-primary-inactive.png'),
      ),
    );
  }
}
