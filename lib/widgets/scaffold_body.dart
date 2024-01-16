import 'package:flutter/material.dart';
import 'package:rickmorty/theme.dart';

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth,
      height: deviceHeight,
      child: Stack(
        children: [
          SizedBox(
            width: deviceWidth,
            height: deviceHeight,
            child: const Image(
              fit: BoxFit.cover,
              image: AssetImage(
                'lib/assets/images/background.png',
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
