import 'package:get/get.dart';

import 'package:cashir_quiz/app/modules/history/bindings/history_binding.dart';
import 'package:cashir_quiz/app/modules/history/views/history_view.dart';
import 'package:cashir_quiz/app/modules/home/bindings/home_binding.dart';
import 'package:cashir_quiz/app/modules/home/views/home_view.dart';
import 'package:cashir_quiz/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:cashir_quiz/app/modules/onboarding/views/onboarding_view.dart';
import 'package:cashir_quiz/app/modules/questions/bindings/questions_binding.dart';
import 'package:cashir_quiz/app/modules/questions/views/questions_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.QUESTIONS,
      page: () => QuestionsView(),
      binding: QuestionsBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}
