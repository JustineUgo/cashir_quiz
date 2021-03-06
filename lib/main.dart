import 'package:cashir_quiz/app/constants/stylings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async{
  await GetStorage.init();
  // GetStorage().erase();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppTheme.blue,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  var storage = GetStorage();

  runApp(
    GetMaterialApp(
      title: "Cashir Quiz",
      initialRoute: storage.read('seen_intro') == true?AppPages.INITIAL : AppPages.INTRO,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
    ),
  );
}
