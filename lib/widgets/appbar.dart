import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickmorty/theme.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    super.key,
    required this.child,
    this.withBackground = true,
  });

  final Widget child;
  final bool withBackground;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: deviceWidth,
          height: 100.w,
          child: withBackground
              ? const Image(
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  image: AssetImage(
                    'lib/assets/images/background.png',
                  ),
                )
              : const SizedBox(),
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
