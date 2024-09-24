

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common_widget/CommonIcon.dart';
import '../../../Common_widget/common_button.dart';
import '../navigation bar/navigation.dart';
import '../notification/notification.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: SizedBox(
            height: 32,
            width: 114,
            child: Image.asset("images/appbar.png")),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CommonIconButton(onTap: (){
              Get.to(()=>const NotificationShow());
            }),
          )
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(

                child: Image.asset("images/payment.gif",fit: BoxFit.fill,)),
            const Text("Payment Gateway",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            const SizedBox(
              height: 30,
            ),
            CommonButton(
                buttonColor: const Color(0xff9a0000),
                buttonName: "Payment Done", onTap: (){
                  Get.offAll(()=>const NavigationBarShow());
            })
          ],
        ),
      ),
    );
  }
}
