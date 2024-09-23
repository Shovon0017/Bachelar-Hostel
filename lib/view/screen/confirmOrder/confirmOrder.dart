import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bachelor_hostel/common%20widget/CommonIcon.dart';
import 'package:bachelor_hostel/view/screen/notification/notification.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({super.key});

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xffFFFFFF),

      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: SizedBox(
            height: 32,
            width: 114,
            child: Image.asset("images/Bachelor Hostel logo.png")),
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
      body: Column(
        children: [
          const Text("Confirm Order",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          const SizedBox(
            height: 100,
          ),
          Image.asset("images/no-product-found.png"),
        ],
      ),
    );
  }
}
