import 'package:get/get.dart';

class BottomNavController extends GetxController{
  int currentIndex = 0;

  void changeScreen(index){
    if(currentIndex==index){
      return;
    }
    currentIndex = index;
    update();
  }
  void backToHome(){
    changeScreen(0);
  }
}