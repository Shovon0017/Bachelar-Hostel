
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Common_widget/CommonIcon.dart';
import '../../../Common_widget/common_text.dart';
import '../../../Common_widget/search_field.dart';
import '../../../controller/getxcontroller/ProductListController.dart';
import '../SliderAllProduct/SliderProduct.dart';
import '../notification/notification.dart';
import '../product_info/product_info.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor:Color(0xffFFFFFF) ,
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
                    controller.searchFunction(searchText: text);
                  },
                ),
              ),
              SizedBox(height: 10),
              CarouselSlider(
                  items: [
                    InkWell(
                      onTap: () {
                        Get.to(()=>SliderProductScreen());
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('images/COMPUTER MONITORS.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    InkWell(
                      onTap: () {Get.to(()=>SliderProductScreen());},
                      child: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('images/PC ACCESSORIES (1).png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    InkWell(
                      onTap: () {Get.to(()=>SliderProductScreen());},
                      child: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/PC PARTS.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    )
                  ],
                  options: CarouselOptions(
                      height: 180,
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      enlargeCenterPage: true)),
              Text("ALL PRODUCT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.red)),
              const SizedBox(height: 10),
              Obx(() => controller.isLoading.isTrue
                  ? const Center(child: CircularProgressIndicator())
                  : controller.productList.isEmpty
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
                                itemCount: controller.productList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => ProductInfo(
                                          id: index,
                                          productData:
                                              controller.productList[index]));
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
                                                        "${controller.productList[index].image}"))),
                                            CommonText(
                                                title:
                                                    "ID : ${controller.productList[index].productId}"),
                                            CommonText(
                                                title:
                                                    "Name : ${controller.productList[index].nameEn}"),
                                            CommonText(
                                                title:
                                                    "Price : ${controller.productList[index].regPrice}Tk"),
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
