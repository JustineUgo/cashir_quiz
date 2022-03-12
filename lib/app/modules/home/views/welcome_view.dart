import 'package:cashir_quiz/app/data/alerts.dart';
import 'package:cashir_quiz/app/data/images.dart';
import 'package:cashir_quiz/app/data/stylings.dart';
import 'package:cashir_quiz/app/modules/questions/bindings/questions_binding.dart';
import 'package:cashir_quiz/app/modules/questions/views/questions_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class WelcomeView extends GetView {
  @override
  Widget build(BuildContext context) {
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
                    'Good morning,',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.size.width,
              height: Get.size.height/4,
              margin: EdgeInsets.only(left: 20, right: 20, top: 50, ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
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
                    height: Get.size.height/4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'This quiz contains 10 multiple choice questions.',
                          style: Theme.of(context).textTheme.headline4!.copyWith(color: AppTheme.white, fontSize: 12),
                        ),
                        OutlinedButton(
                          child: Text('Begin quiz'),
                          style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.white,
                            backgroundColor: Color(0xff009ffd),
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                            side: BorderSide(color: AppTheme.white, width: 1),
                          ),
                          onPressed: () {
                            Get.to(()=> QuestionsView(), binding: QuestionsBinding());
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Cashir Quiz',
                              textAlign: TextAlign.right,
                              style: Theme.of(context).textTheme.headline1!.copyWith(color: AppTheme.white, fontSize: 35),
                            ),
                            Text(
                              '10 Questions',
                              style: Theme.of(context).textTheme.headline4!.copyWith(color: AppTheme.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Text(
                'Subjects',
                style: Theme.of(context).textTheme.headline1
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Get.to(()=> QuestionsView(), binding: QuestionsBinding());
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          width: (Get.size.width/2)-30,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xffff0f7b),
                                Color(0xfff89b29),
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '10',
                                    style: Theme.of(context).textTheme.headline1!.copyWith(color: AppTheme.white, fontSize: 30),
                                  ),
                                  Icon(Icons.directions_bus, color: AppTheme.white, size: 40,)
                                ],
                              ),
                              Text(
                                'Vehicles',
                                style: Theme.of(context).textTheme.headline3!.copyWith(color: AppTheme.white,),
                              ),
                              Text(
                                'Answer ten questions on boats',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headline4!.copyWith(color: AppTheme.white, fontSize: 10),
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          QuizAlerts().error('Opps...', 'Questions on boats subject are unavailable', context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          width: (Get.size.width/2)-30,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff40c9ff),
                                Color(0xffe81cff)
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '10',
                                    style: Theme.of(context).textTheme.headline1!.copyWith(color: AppTheme.white, fontSize: 30),
                                  ),
                                  Icon(Icons.directions_boat_filled_outlined, color: AppTheme.white, size: 40,)
                                ],
                              ),
                              Text(
                                'Boats',
                                style: Theme.of(context).textTheme.headline3!.copyWith(color: AppTheme.white,),
                              ),
                              Text(
                                'Answer ten questions on boats',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headline4!.copyWith(color: AppTheme.white, fontSize: 10),
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          QuizAlerts().error('Opps...', 'Questions on bikes subject are unavailable', context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          width: (Get.size.width/2)-30,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff9bafd9),
                                Color(0xff103783)
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '10',
                                    style: Theme.of(context).textTheme.headline1!.copyWith(color: AppTheme.white, fontSize: 30),
                                  ),
                                  Icon(Icons.directions_bike, color: AppTheme.white, size: 40,)
                                ],
                              ),
                              Text(
                                'Bikes',
                                style: Theme.of(context).textTheme.headline3!.copyWith(color: AppTheme.white,),
                              ),
                              Text(
                                'Answer ten questions on boats',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headline4!.copyWith(color: AppTheme.white, fontSize: 10),
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          QuizAlerts().error('Opps...', 'Questions on trains subject are unavailable', context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          width: (Get.size.width/2)-30,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xffef745c),
                                Color(0xff34073d)
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '10',
                                    style: Theme.of(context).textTheme.headline1!.copyWith(color: AppTheme.white, fontSize: 30),
                                  ),
                                  Icon(Icons.directions_subway, color: AppTheme.white, size: 40,)
                                ],
                              ),
                              Text(
                                'Trains',
                                style: Theme.of(context).textTheme.headline3!.copyWith(color: AppTheme.white,),
                              ),
                              Text(
                                'Answer ten questions on boats',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headline4!.copyWith(color: AppTheme.white, fontSize: 10),
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
