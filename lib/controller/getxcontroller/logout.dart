
import 'package:bachelar_hostel/view/screen/auth/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/log_out.dart';
class LogOutService extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  logOutFun() async {
    isLoading.value = true;
    bool message = await LogOutApi.logoutApi();
    isLoading.value = false;

    if (message) {
      Get.offAll(() =>   const SignIn());
      return;
    }
  }
}
