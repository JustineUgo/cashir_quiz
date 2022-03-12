import 'package:cashir_quiz/app/modules/home/bindings/home_binding.dart';
import 'package:cashir_quiz/app/modules/home/views/home_view.dart';
import 'package:cashir_quiz/app/modules/questions/models/question_model.dart';
import 'package:cashir_quiz/app/modules/questions/providers/questions_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class QuestionsController extends GetxController {
  
  var questionIndex = 0.obs;
  ScrollController scrollController = ScrollController();
  QuestionsProvider questionsProvider = QuestionsProvider();
  var storage = GetStorage();
  List<Question> questionsPlaceholder = [];

  var selectedOptions = ["","","","","","","","","",""].obs;

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

  //get questions from api and convert to Question model for ui
  Future<List<Question>> getQuestions() async{
    List<Question> questions = [];
    List responses = await questionsProvider.fetchQuestion();
    if(responses.isNotEmpty){
      for(var response in responses){
        questions.add(Question.fromMap(response));
      }
    }

    questionsPlaceholder = questions;
    return questions;
  }

  //cache question in memory
  void saveAnswers(){
    List cacheQuestions = [];

    for(Question question in questionsPlaceholder){
      question.selected = selectedOptions[questionsPlaceholder.indexOf(question)];
      cacheQuestions.add(question.toMap());
    }

    var storedQuestions = storage.read('questions');
    if(storedQuestions == null){
      storage.write('questions', [cacheQuestions]);
    }else{
      storage.write('questions', [...storedQuestions, cacheQuestions]);
    }

    Get.back();
    Get.back();
  }
  
}
