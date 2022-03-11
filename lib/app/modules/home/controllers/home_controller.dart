import 'package:cashir_quiz/app/modules/home/views/home_view.dart';
import 'package:cashir_quiz/app/modules/home/views/welcome_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  

  var pageIndex = 0.obs;

  List screens = [
    WelcomeView()
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  
}
