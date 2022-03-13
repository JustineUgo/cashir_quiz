import 'package:cashir_quiz/app/modules/home/views/quiz_view.dart';
import 'package:cashir_quiz/app/modules/home/views/survey_view.dart';
import 'package:cashir_quiz/app/modules/home/views/welcome_view.dart';
import 'package:cashir_quiz/app/modules/questions/bindings/questions_binding.dart';
import 'package:cashir_quiz/app/modules/questions/views/questions_view.dart';
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
  void onClose() {}

  //move to quiz
  void goToQuiz(){
    Get.back();
    Get.to(()=> QuestionsView(), binding: QuestionsBinding());
  }

  //updates greeting text
  void parseTime(){
    int hour = DateTime.now().hour;
    print(hour);

    if(hour < 12){
      greeting.value = 'Good morning';
    }else if(hour>15){
      print('Irs evening');
      greeting.value = 'Good evening';
    }else{
      greeting.value = 'Good afternoon';
    }
  }

  //fetches past quizzes from local storage
  void loadHistory(){
    history = storage.read('questions');  
  }
  
}
