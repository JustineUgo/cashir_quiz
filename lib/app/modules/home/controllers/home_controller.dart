import 'package:cashir_quiz/app/modules/home/views/home_view.dart';
import 'package:cashir_quiz/app/modules/home/views/quiz_view.dart';
import 'package:cashir_quiz/app/modules/home/views/survey_view.dart';
import 'package:cashir_quiz/app/modules/home/views/welcome_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  
  var storage = GetStorage();

  List? history = [];
  var pageIndex = 0.obs;
  var greeting = ''.obs;

  List screens = [
    WelcomeView(),
    QuizView(),
    SurveyView()
  ];

  @override
  void onInit() {
    parseTime();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void parseTime(){
    int hour = DateTime.now().hour;

    if(hour < 12){
      greeting.value = 'Good morning';
    }else if(hour>15){
      greeting.value = 'Good evening';
    }else{
      greeting.value = 'Good afternoon';
    }
  }

  void loadHistory(){
    history = storage.read('questions');  
  }
  
}
