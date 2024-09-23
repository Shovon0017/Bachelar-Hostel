
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_mart/common%20widget/common_button.dart';
import 'package:pc_mart/view/screen/auth/SignIn.dart';
class LanguageSelection extends StatelessWidget {
  const LanguageSelection({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor:const Color(0xffFFFFFF),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/english select logo.png"),
              const SizedBox(height: 90),
              CommonButton(buttonColor:Colors.grey ,
                  buttonName: "বাংলা",textColor: Colors.white, onTap: (){
                    Get.to(()=>const SignIn(
                    ));
              }),
              CommonButton(buttonColor:const Color(0xff9a0000) ,
                  buttonName: "English", onTap: (){
                Get.to(()=>const SignIn(
                ));
              })
            ],
          ),
        ),
      ),
    );
  }
}
