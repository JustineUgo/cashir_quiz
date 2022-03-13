import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FancyOnBoarding(
        doneButtonText: "Done",
        skipButtonText: "Skip",
        pageList: controller.pageList,
        onDoneButtonPressed: () =>
            controller.seenIntro(),
        onSkipButtonPressed: () =>
            controller.seenIntro(),
      )
    );
  }
}
