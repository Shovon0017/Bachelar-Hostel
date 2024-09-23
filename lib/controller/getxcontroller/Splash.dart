import 'dart:async';

import 'package:get/get.dart';
class SplashController extends GetxController {
   nextPage(){
    Timer(const Duration(seconds: 3), (){
      Get.to(()=>const StartPage());
    });
   }
   @override
  void onInit() {
    nextPage();
    super.onInit();
  }
}
