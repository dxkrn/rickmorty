import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickmorty/theme.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: deviceWidth,
          height: 100.w,
          color: primaryDarkColor,
          child: const Image(
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            image: AssetImage(
              'lib/assets/images/background.png',
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            width: deviceWidth,
            height: 64.w,
            child: child,
          ),
        ),
      ],
    );
  }
}
