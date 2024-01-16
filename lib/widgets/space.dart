import 'package:flutter/material.dart';

class SpaceVertical extends StatelessWidget {
  const SpaceVertical({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class SpaceHorizontal extends StatelessWidget {
  const SpaceHorizontal({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
