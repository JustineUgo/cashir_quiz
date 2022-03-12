import 'package:cashir_quiz/app/data/stylings.dart';
import 'package:cashir_quiz/app/modules/questions/models/question_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0,
        title: Text('Answered Questions', style: TextStyle(color: Colors.black54),),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: InkWell(onTap: () => Get.back(), child: Icon(Icons.arrow_back, color: AppTheme.black)),
        leadingWidth: 80,
      ),
      body: Container(
      width: Get.size.width,
      height: Get.size.height,
      decoration: BoxDecoration(
        color: AppTheme.white
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: Get.size.width,
            child: Text(
              'Vehicle:',
              style: Theme.of(context).textTheme.headline2
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 0, bottom: 20),
              child:  ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index){
                  Question question = controller.questions[index];

                  return questionCard(context, index, question, controller);
                },
              ),
            )
          ),

          Container(
            width: Get.size.width,
            height: Get.size.height/6,
            margin: EdgeInsets.only(left: 0, right: 0, top: 50, ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: AppTheme.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  width: Get.size.width,
                  height: Get.size.height/6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xff009ffd),
                        Color(0xff36096d)
                      ],
                    ),
                    color: AppTheme.dark,
                  ), 
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Score:',
                            style: Theme.of(context).textTheme.headline4!.copyWith(color: AppTheme.white, )
                          ),
                          Text(
                            '${controller.percentageScore.value}%',
                            textAlign: TextAlign.right,
                            style: Theme.of(context).textTheme.headline1!.copyWith(color: AppTheme.white,  fontSize:35),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                          child: Text(
                            "Done",
                            style: Theme.of(context).textTheme.headline2!.copyWith(color: AppTheme.blue, fontSize: 15,)
                          ),
                        ),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(AppTheme.blue),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              side: BorderSide(color: Colors.white)
                            )
                          )
                        ),
                        onPressed: () => Get.back()
                      )
                    ],
                  ),
                ),
              ],
            )
          )

          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 20),
          //   width: Get.size.width,
          //   height: Get.size.height/6,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Obx(()=>
          //         Text(
          //           'Score: ${controller.percentageScore.value}%',
          //           style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black.withOpacity(.8)),
          //         ),
          //       ),
          //       ElevatedButton(
          //         child: Text(
          //           'Done',
          //           style: Theme.of(context).textTheme.headline4!.copyWith(color: AppTheme.white),
          //         ),
          //         style: ElevatedButton.styleFrom(
          //           primary: AppTheme.blue.withOpacity(.9),
          //           onPrimary: Colors.white,
          //           padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
          //           shape: StadiumBorder()
          //         ),
          //         onPressed: () {
          //           Get.back();
          //         },
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
      )
    );
  }
}


Widget questionCard(BuildContext context, int questionIndex, Question question, HistoryController controller){
  int number = questionIndex+1;

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
      color: AppTheme.blue
    ),
    child: Column(
      children: [
        Center(
          child: Text(
            '$number.\n$questionText',
            style: Theme.of(context).textTheme.headline2!.copyWith(color: AppTheme.white),
          ),
        ),
        SizedBox(height: 50),
        Expanded(
          child: Container(
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                String optionText = options[index];
                return option(context, optionText, question, questionIndex, controller);
              }
            )
          ),
        ),
        SizedBox(height: 20),
        Container(
          child: question.selected ==""? Text(
            'Not answered',
            style: Theme.of(context).textTheme.headline4!.copyWith(color: AppTheme.white),
          ):SizedBox.shrink()
        )
      ],
    ),
  );
}


Widget option(BuildContext context, String option, Question question, int questionIndex, HistoryController controller){

  return Container(
    margin: EdgeInsets.only(bottom: 10),
    padding: EdgeInsets.symmetric( horizontal: 30),
    height: 50,
    decoration: BoxDecoration(
      border: Border.all(color: AppTheme.greyColor),
      borderRadius: BorderRadius.all(Radius.circular(40)),
      color: question.correct_answer == option ? 
      Colors.green.withOpacity(.6): 
      ( (option == question.selected) && option != question.correct_answer ?
        Colors.red.withOpacity(.6):
        AppTheme.blue
      )
    ),
    alignment: Alignment.centerLeft,
    child: Text(
      option,
      style: Theme.of(context).textTheme.headline4!.copyWith(color: AppTheme.white),
    ),
  );
}
