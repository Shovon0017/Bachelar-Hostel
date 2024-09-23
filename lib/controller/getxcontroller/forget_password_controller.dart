
import 'package:bachelar_hostel/controller/api-controller/auth/forget_password_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class ForgetPasswordController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  RxBool isLoading = false.obs;

  checkValidUser() async {
    isLoading.value = true;
    bool otp = await ForgetPasswordApi.forgetPasswordApi(phone: "");
    if (otp) {
      bool status =
      isLoading.value = false;
      if(status) {
        Get.to(()=> ());
      }
    }else{
      isLoading.value = false;
    }
  }
}
