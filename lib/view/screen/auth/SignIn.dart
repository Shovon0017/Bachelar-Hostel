import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInService());
    SignInController signInController = Get.put(SignInController());
    return Scaffold(
      backgroundColor:const Color(0xffFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: signInController.formKey,
                child: Column(
                  children: [
                    const Text("Sign In",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: Color(0xff9a0000)),),
                    SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset("images/signin.png")),
                    EmailTextField(  emailController: signInController.emailController,
                    ),
                    buildSizedBox(height: 10),
                    PasswordTextField(
                      passController: signInController.passwordController,
                    ),
                    buildSizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(onTap: (){
                          Get.to(()=>const ForgetPassword());
                        },
                            child: const CommonText(title: "Forget Password",fWeight: FontWeight.bold,fSize: 15,fColor:Color(0xff9a0000),)),
                      ],
                    ),
                    buildSizedBox(height: 10),
                    Obx(()=> signInController.isLoading.isFalse ?  CommonButton(
                      buttonName: "Sign In",
                      onTap: () {
                        if (!signInController.formKey.currentState!.validate()) {
                          return ;
                        }
                        log("==========222222222222===============");
                        signInController.signInFun();
                      },
                    ) : const CommonLoadingButton()),
                    buildSizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an Account",style: TextStyle(fontWeight: FontWeight.bold),),
                        buildSizedBox(width: 10),
                        GestureDetector(
                          child:const Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff9a0000),fontSize: 17),),
                          onTap: (){
                            Get.to(() => const SignUp());
                          },
                        )
                      ],
                    )

                    //
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox({double? height, double? width}) =>
      SizedBox(height: height, width: width);
}
