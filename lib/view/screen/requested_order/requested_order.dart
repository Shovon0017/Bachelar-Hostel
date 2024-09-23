import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_mart/common%20widget/CommonIcon.dart';
import 'package:pc_mart/view/screen/notification/notification.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xffFFFFFF),

      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: SizedBox(
            height: 32,
            width: 114,
            child: Image.asset("images/pcmart.jpg")),
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
          const Text("Requested Order",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          const SizedBox(
            height: 100,
          ),
          Image.asset("images/no-product-found.png"),
        ],
      ),
    );
  }
}
