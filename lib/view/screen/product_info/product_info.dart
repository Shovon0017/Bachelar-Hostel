


import 'package:bachelar_hostel/model/hostelInfoModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common_widget/CommonIcon.dart';
import '../../../Common_widget/common_button.dart';
import '../../../controller/getxcontroller/hostel_Info.dart';
import '../OrderInfo/OrderInfo.dart';
import '../notification/notification.dart';

class HostelInfo extends StatelessWidget {
   HostelInfo({super.key, required this.id, required this.hostelData,});
  final int id;

  var value=-1;
   final Hosteldetails hostelData;
  @override
  Widget build(BuildContext context) {
    ProductInfoController controller = Get.put(ProductInfoController());
    return Scaffold(backgroundColor: Colors.white,
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
      body:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10),
            child: Column(
              children: [
                Container(
                  height: 230,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 230,
                        child: Image.asset("${controller.hostelInfo[id].image}")
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
               Text("Name:${controller.hostelInfo[id].name}"),
                const SizedBox(height: 10),
                Text("Number:${controller.hostelInfo[id].number}"),
                const SizedBox(height: 10),
                Text("Address:${controller.hostelInfo[id].address}"),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border:const Border.fromBorderSide(BorderSide(color: Colors.black))),
                  child:  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Description:${controller.hostelInfo[id].description}"),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonButton(
                      buttonWidth: 150,
                        buttonColor: Colors.red,
                        buttonName: "Buy Now",
                        onTap: () {
                          Get.dialog(AlertDialog(
                              title: const Text("Order Info",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    DropdownButtonFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                                borderSide:
                                                const BorderSide(color: Colors.black))),
                                        value: value,
                                        items: const [
                                          DropdownMenuItem(
                                            value: -1,
                                            child: Text("Product Selection"),
                                          ),
                                          DropdownMenuItem(
                                              value: 0,
                                              child: Text("Type-1")),
                                          DropdownMenuItem(
                                              value: 1,
                                              child: Text("Type-2")),
                                        ],
                                        onChanged: (v) {}),
                                    const SizedBox(height: 10),
                                    DropdownButtonFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                                borderSide:
                                                const BorderSide(color: Colors.black))),
                                        value: value,
                                        items: const [
                                          DropdownMenuItem(
                                            value: -1,
                                            child: Text("Choose quantity"),
                                          ),
                                          DropdownMenuItem(
                                              value: 0,
                                              child: Text("1 piece")),
                                          DropdownMenuItem(
                                              value: 1,
                                              child: Text("5 piece")),
                                          DropdownMenuItem(
                                              value: 2,
                                              child: Text("10 piece"))
                                        ],
                                        onChanged: (v) {}),
                                    const SizedBox(height: 10),
                                    DropdownButtonFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                                borderSide:
                                                const BorderSide(color: Colors.black))),
                                        value: value,
                                        items: const [
                                          DropdownMenuItem(
                                            value: -1,
                                            child: Text("Choose Color"),
                                          ),
                                          DropdownMenuItem(
                                              value: 0,
                                              child: Text("Blue")),
                                          DropdownMenuItem(
                                              value: 1,
                                              child: Text("Green")),
                                          DropdownMenuItem(
                                              value: 2,
                                              child: Text("Red"))
                                        ],
                                        onChanged: (v) {}),
                                    const SizedBox(height: 10),
                                    CommonButton(
                                      buttonWidth: 150,
                                        buttonColor: Colors.red,
                                        buttonName: "Confirm Order", onTap:(){
                                      Get.to(()=>const OrderInfo());
                                    })
                                  ],
                                ),
                              )
                          ));
                        }),
                    CommonButton(
                      buttonWidth:150,

                        buttonName: "Add to cart", onTap: ()async{
                        controller.addToCartProduct(productID: id, qty: 1);

                        Get.back();
                    })
                  ],
                )
              ],
            ),
          ),
    );
  }
}