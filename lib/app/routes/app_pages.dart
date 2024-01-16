import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../modules/detail/bindings/detail_binding.dart';
import '../modules/detail/views/detail_view.dart';
import '../modules/discover/bindings/discover_binding.dart';
import '../modules/discover/views/discover_view.dart';
import '../modules/favorite/bindings/favorite_binding.dart';
import '../modules/favorite/views/favorite_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fade,
      curve: Curves.ease,
      transitionDuration: const Duration(
        milliseconds: 200,
      ),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fade,
      curve: Curves.ease,
      transitionDuration: const Duration(
        milliseconds: 200,
      ),
    ),
    GetPage(
      name: _Paths.DISCOVER,
      page: () => const DiscoverView(),
      binding: DiscoverBinding(),
      transition: Transition.fade,
      curve: Curves.ease,
      transitionDuration: const Duration(
        milliseconds: 200,
      ),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => const DetailView(),
      binding: DetailBinding(),
      transition: Transition.fade,
      curve: Curves.ease,
      transitionDuration: const Duration(
        milliseconds: 200,
      ),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => const FavoriteView(),
      binding: FavoriteBinding(),
      transition: Transition.fade,
      curve: Curves.ease,
      transitionDuration: const Duration(
        milliseconds: 200,
      ),
    ),
  ];
}
