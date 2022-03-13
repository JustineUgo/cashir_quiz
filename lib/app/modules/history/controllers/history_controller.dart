import 'package:cashir_quiz/app/modules/questions/models/question_model.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  
  List<Question> questions = Get.arguments['questions'];
  var percentageScore = 0.obs;

  @override
  void onInit() {
    calculateScore();
    super.onInit();
  }


  @override
  void onClose() {}

  //calc score of each quiz
  calculateScore(){
    int score = 0;
    for(Question question in questions){
      if (question.correct_answer == question.selected) ++score;
    }
    percentageScore.value=score*10;
  }
  
}
