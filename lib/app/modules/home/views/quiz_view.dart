import 'package:cashir_quiz/app/constants/images.dart';
import 'package:cashir_quiz/app/constants/stylings.dart';
import 'package:cashir_quiz/app/modules/home/controllers/home_controller.dart';
import 'package:cashir_quiz/app/modules/questions/bindings/questions_binding.dart';
import 'package:cashir_quiz/app/modules/questions/views/questions_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class QuizView extends GetView<HomeController> {
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
          width: Get.size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Text(
                  'Are you ready?',
                  style: Theme.of(context).textTheme.headline2
                ),
              ),
              
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'You will be served 10 questions \nrelated to the vehicle category',
                  style: Theme.of(context).textTheme.headline4
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 20),
                child: Divider(
                ),
              ),
              OutlinedButton(
                child: Text('Begin quiz'),
                style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Colors.white,
                  backgroundColor: AppTheme.blue,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  side: BorderSide(color: AppTheme.white, width: 1),
                ),
                onPressed: () {
                  Get.to(()=>QuestionsView(), binding: QuestionsBinding());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
