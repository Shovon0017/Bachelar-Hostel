import 'dart:developer';

import 'package:bachelar_hostel/controller/api-controller/auth/sign_in_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  signInFun() async {
    isLoading.value = true;
    bool message = await SignInService.signInService(
        email: emailController.text, password: passwordController.text);
    isLoading.value = false;

    if (message) {
      log("Next Page");
      Get.offAll(() =>  const NavigationBarShow());
      return;
    }
  }
  @override
  void onInit() {
    emailController.text="Shovon@gmail.com";
    passwordController.text="12345678";
    super.onInit();
  }
}
