

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/getxcontroller/forget_password_controller.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller =Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forget Password"),
        centerTitle: true,
      ),
      body: const Center(
          child:Column(
            children: [

            ],
          )
      ),
    );
  }
}
