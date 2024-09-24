import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common_widget/CommonIcon.dart';
import '../../../Common_widget/common_text.dart';
import '../../../Common_widget/search_field.dart';
import '../../../controller/getxcontroller/hostelListController.dart';
import '../notification/notification.dart';
import '../product_info/product_info.dart';

class SliderProductScreen extends StatelessWidget {
  const SliderProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: SizedBox(
            height: 50, width: 150, child: Image.asset("images/appbar.png")),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CommonIconButton(onTap: () {
              Get.to(() => const NotificationShow());
            }),
          )
        ],
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SearchField(
                  onChanged: (String text) {
                    log("===== onChanged : $text ==================");
                    controller.searchFunction(searchText: text);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Obx(() => controller.isLoading.isTrue
                  ? const Center(child: CircularProgressIndicator())
                  : controller.hostelList.isEmpty
                  ? const Center(
                  child: CommonText(title: "Empty Product List"))
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      physics: const PageScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.hostelList.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Get.to(() => ProductInfo(
                            //     id: index,
                            //     productData:
                            //     controller.productList[index]));
                          },
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            child: SizedBox(
                              height: 220,
                              width:
                              MediaQuery.sizeOf(context).width /
                                  2.2,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image(
                                          image: AssetImage(
                                              "${controller.hostelList[index].image}"))),
                                  CommonText(
                                      title:
                                      "Name : ${controller.hostelList[index].name}"),
                                  CommonText(
                                      title:
                                      "Environment : ${controller.hostelList[index].environment}"),
                                  CommonText(
                                      title:
                                      "Address : ${controller.hostelList[index].address}"),
                                  CommonText(
                                      title:
                                      "Price : ${controller.hostelList[index].price}Tk"),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
