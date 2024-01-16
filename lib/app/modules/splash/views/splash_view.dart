import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rickmorty/theme.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('lib/assets/images/logo-rick-morty.png'),
            ),
            Text(
              'By Dicky Khurniawan',
              style: mediumTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
