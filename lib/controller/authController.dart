import 'package:get/get.dart';

class AuthController extends GetxController{
  bool isEmpty=false;

  empty(){
    if(isEmpty==false){
      isEmpty=true;
      update();
    }
  }

}