import 'package:algorizaui/constants/colors.dart';
import 'package:algorizaui/constants/strings.dart';
import 'package:algorizaui/helper/routes.dart';
import 'package:algorizaui/model/content_model.dart';
import 'package:algorizaui/view/login_screen.dart';
import 'package:algorizaui/view/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardingController extends GetxController{
  int currentIndex=0;
  PageController? pageController;

  List<ContentModel> contents=[
  ContentModel(Strings.title1, Strings.subTitle1, 'images/boarding1.svg'),
  ContentModel(Strings.title2, Strings.subTitle1, 'images/boarding2.svg'),
  ContentModel(Strings.title2, Strings.subTitle1, 'images/boarding3.svg')
  ];

  @override
  void onInit() {
    pageController= PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController!.dispose();
    super.dispose();
  }

  void changePage(int index){
    currentIndex=index;
    update();
  }

  void nextPage(){
    if(currentIndex==contents.length-1){
      goToLogin();
    }
    else{
      pageController!.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
    }
    update();
  }

  void goToLogin(){
    AppRoute.pushReplacement(LoginScreen());
  }

  void goToRegister(){
    AppRoute.pushReplacement(RegisterScreen());
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 25,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex==index?ColorsApp.dotsColor:Colors.grey.withOpacity(.3),
      ),
    );
  }
}