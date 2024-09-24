

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Common_widget/common_button.dart';
import '../../../controller/getxcontroller/forget_password_controller.dart';
import '../auth/widget/auth  widget/phone.dart';
import '../reset_paswword/reset_password.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller = Get.put(ForgetPasswordController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: const Text("Forget Password",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 30),),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Center(
          child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Image.asset("images/forget_pass.png"),
                const SizedBox(height: 10),
                PhoneTextField(phoneController:controller.phoneController),
                const SizedBox(height: 10),
                CommonButton(buttonName: "Sent OTP", onTap: (){
                  Get.to(()=>const ResetPass());
                  // controller.checkValidUser();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
