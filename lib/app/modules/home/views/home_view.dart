import 'package:cashir_quiz/app/constants/stylings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=> controller.screens[controller.pageIndex.value]),
      bottomNavigationBar: Material(
        elevation: 20,
        child: Obx(()=>
          SalomonBottomBar(
            
            unselectedItemColor: Color(0xff4682B4),
            currentIndex: controller.pageIndex.value,
            onTap: (i) {
              controller.pageIndex.value = i;
              if(i==2) controller.loadHistory();
            },
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                selectedColor: AppTheme.blue,
              ),

              /// Quiz
              SalomonBottomBarItem(
                icon: Icon(Icons.laptop_chromebook_outlined),
                title: Text("Quiz"),
                selectedColor: AppTheme.blue,
              ),

              /// Survey
              SalomonBottomBarItem(
                icon: Icon(Icons.bar_chart_outlined),
                title: Text("Survey"),
                selectedColor: AppTheme.blue,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
