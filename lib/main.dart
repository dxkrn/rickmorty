import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rickmorty/app/data/get_storage/get_storage.dart';
import 'package:rickmorty/app/modules/splash/bindings/splash_binding.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await GetStorage.init();

  runApp(
    ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
          ),
        ),
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        initialBinding: SplashBinding(),
      ),
    ),
  );

  if (getStorage.read('layoutStyle') == null) {
    getStorage.write('layoutStyle', 'grid');
  }
}
