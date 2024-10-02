
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Common_widget/common_button.dart';
import '../auth/SignIn.dart';
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
              Image.asset("images/languagee.png"),

              CommonButton(buttonColor:Colors.grey ,
                  buttonName: "বাংলা",textColor: Colors.white, onTap: (){
                    Get.to(()=>const SignIn(
                    ));
              }),
              CommonButton(
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
