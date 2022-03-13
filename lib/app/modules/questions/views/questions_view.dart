import 'package:cashir_quiz/app/constants/alerts.dart';
import 'package:cashir_quiz/app/constants/stylings.dart';
import 'package:cashir_quiz/app/modules/questions/models/question_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/questions_controller.dart';

class QuestionsView extends GetView<QuestionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff145EE5),
        elevation: 0,
        title: Text('Questions'),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () {
            QuizAlerts().confirm('Do you want to submit', 'Submit', 'Cancel', controller.saveAnswers,Get.back, context);
          }, 
          child: Icon(Icons.arrow_back)),
      ),
      body: Container(
        width: Get.size.width,
        height: Get.size.height,
        decoration: BoxDecoration(
          color: AppTheme.blue
        ),
        child: Container(
        width: Get.size.width,
        height: Get.size.height,
        decoration: BoxDecoration(
          color: AppTheme.dark
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: Get.size.width,
              height: Get.size.height/6,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index){
                  return count(index+1, controller);
                }
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: FutureBuilder<List<Question>>(
                  future: controller.getQuestions(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting){
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(color: AppTheme.white,),
                            SizedBox(height: 20),
                            Text(
                              'Fetching questions..',
                              style: Theme.of(context).textTheme.headline4!.copyWith(color: AppTheme.white)
                            )
                          ],
                        )
                      );
                    }

                    List<Question> questions = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: questions.length,
                      itemBuilder: (context, index){
                        Question question = questions[index];
                        return questionCard(context, index, question, controller);
                      },
                    );
                  }
                ),
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: Get.size.width,
              height: Get.size.height/6,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index){
                  return count(index+6, controller);
                }
              ),
            ),
          ],
        ),
      ),
      )
    );
  }
}

Widget count(int index, QuestionsController controller){
  return InkWell(
    child: Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: CircleAvatar(
        radius: 28,
        backgroundColor: AppTheme.white,
        child: Obx(()=>
          CircleAvatar(
            radius: 26,
            backgroundColor: AppTheme.blue,
            child: controller.selectedOptions[index-1] != ""? 
            Icon(Icons.check, color: AppTheme.white,): 
            Text(
              index.toString()
            ),
          ),
        ),
      ),
    ),
  );
}


Widget questionCard(BuildContext context, int questionIndex, Question question, QuestionsController controller){
  int number = questionIndex+1;
  String? selected = question.selected;

  String questionText = question.question;
  List<String> options = [...question.incorrect_answers, question.correct_answer];
  options.shuffle();

  return Container(
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.only(left: 20),
    height: Get.size.height/2,
    width: Get.size.width-60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: AppTheme.white
    ),
    child: Column(
      children: [
        Center(
          child: Text(
            '$number.\n$questionText',
            style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 18),
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: Container(
            child: Obx((){

              return ListView.builder(
                padding: EdgeInsets.all(controller.selectedOptions.length.toDouble()),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  String optionText = options[index];
                  return option(context, optionText, questionIndex, controller);
                }
              );
            }),
          ),
        ),
        SizedBox(height: 20),
        questionIndex == 9? Container(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            child: Text('Finish'),
            onPressed: () {
              QuizAlerts().confirm('Do you want to submit', 'Submit', 'Cancel', controller.saveAnswers,Get.back, context);
            },
            style: ElevatedButton.styleFrom(
              primary: AppTheme.blue,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              textStyle: TextStyle(
                fontSize: 15,
              )
            ),
          ),
        ): SizedBox.shrink()
      ],
    ),
  );
}


Widget option(BuildContext context, String option, int questionIndex, QuestionsController controller){

  return InkWell(
    onTap: (){
      controller.selectedOptions[questionIndex] = option;
    },
    child: Obx(()=>
      Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric( horizontal: 30),
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.greyColor),
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: controller.selectedOptions[questionIndex] == option? AppTheme.greyColor: AppTheme.white
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          option,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    ),
  );
}