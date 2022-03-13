import 'package:cashir_quiz/app/modules/home/bindings/home_binding.dart';
import 'package:cashir_quiz/app/modules/home/views/home_view.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {

  var storage = GetStorage();

  //list of intro pages
  final pageList = [
    PageModel(
        color: const Color(0xFF678FB4),
        heroImagePath: 'assets/svg/quiz.svg',
        title: Text('Cashir Quiz',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('Attempt quiz from the app from\ndifferent categories\n\n\n*Swipe to move*',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            )),
        iconImagePath: 'assets/svg/quiz.svg',
    ),
        // heroImageColor: Colors.white),
    PageModel(
        color: const Color(0xFF4682B4),
        heroImagePath: 'assets/svg/score.svg',
        title: Text('Score',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text(
            'View your score after taking a quiz.\nRecorded in percentage\n\n\n*Swipe to move*',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            )),
        iconImagePath: 'assets/svg/score.svg',
        // heroImageColor: Colors.white),
    ),
    PageModel(
      color: const Color(0xFF9B90BC),
      heroImagePath: 'assets/svg/survey.svg',
      title: Text('History',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text('View your previous performance\nand learn from the correct options\n\n\n*Swipe to move*',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          )),
      iconImagePath: 'assets/svg/survey.svg',
    ),
  ];
  
  @override
  // ignore: unnecessary_overrides
  void onInit() async{
    super.onInit();
  }

  @override
  void onClose() {}
  
  //records viewing of onboarding at first launch
  void seenIntro(){
    storage.write('seen_intro', true);
    Get.off(()=>HomeView(), binding: HomeBinding());
  }

}
