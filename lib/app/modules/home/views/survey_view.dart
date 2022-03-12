import 'package:cashir_quiz/app/data/images.dart';
import 'package:cashir_quiz/app/data/stylings.dart';
import 'package:cashir_quiz/app/modules/history/bindings/history_binding.dart';
import 'package:cashir_quiz/app/modules/history/views/history_view.dart';
import 'package:cashir_quiz/app/modules/home/controllers/home_controller.dart';
import 'package:cashir_quiz/app/modules/questions/models/question_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SurveyView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: PreferredSize( 
        preferredSize: Size.fromHeight(120.0),
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top, left: 30, right: 30),
          height: 120,
          decoration: BoxDecoration(
            color: AppTheme.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome!',
                    style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black.withOpacity(.7)),
                  ),
                  Text(
                    '${controller.greeting.value},',
                    style: Theme.of(context).textTheme.headline4,
                  )
                ]
              ),
              CircleAvatar(
                backgroundImage: AssetImage(PlaceholderImages.avatar),
              ),
            ]
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          width: Get.size.width,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'History',
                  style: Theme.of(context).textTheme.headline1
                ),
              ),
              SizedBox(height: 30,),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.history == null ?0 :controller.history!.length,
                  itemBuilder: (context, index){
                    List questionsMap = controller.history![index];
                    print(index);
                    print(questionsMap);print('\n\n\n\n');
                    List<Question> questions = [];

                    questionsMap.forEach((element) { 
                      questions.add(Question.fromMap(element));
                    });
                    return surveyCard(context, questions);
                  },
                ), 
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget surveyCard(BuildContext context, List questions){

  DateTime dateTime = DateTime.now();
  final format = DateFormat('HH:mm | dd MMM');
  final timeStamp = format.format(dateTime);
  int answered = 10;
  int score = 0;

  for(Question question in questions){
    if(question.selected == ""){
      --answered;
    }

    if(question.selected == question.correct_answer){
      ++score;
    }
  }

  return InkWell(
    onTap: () => Get.to(()=> HistoryView(), binding: HistoryBinding(), arguments: {'questions': questions}),
    child: Container(
      padding: EdgeInsets.all(20),
      height: 100,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff009ffd),
            AppTheme.blue
          ],
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppTheme.white,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: AppTheme.blue,
              child: Icon(Icons.directions_bus, color: AppTheme.white, ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Vehicle',
                style: Theme.of(context).textTheme.headline2!.copyWith(color: AppTheme.white),
              ),
              Text(
                'Answered $answered question(s)',
                style: Theme.of(context).textTheme.headline4!.copyWith(color: AppTheme.white, fontSize: 12),
              )
            ]
          ),
          Spacer(),
          Text(
            (score*10).toString() + '%',
            style: Theme.of(context).textTheme.headline4!.copyWith(color: AppTheme.white, fontSize: 12),
          )
        ]
      ),
    ),
  );
}

