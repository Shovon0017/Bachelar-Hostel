import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pc_mart/common%20widget/CommonIcon.dart';
import 'package:pc_mart/common%20widget/common_button.dart';
import 'package:pc_mart/common%20widget/custom_order_shimmer_loading.dart';
import 'package:pc_mart/controller/getX%20controller/cart.dart';
import 'package:pc_mart/view/screen/OrderInfo/OrderInfo.dart';
import 'package:pc_mart/view/screen/cart/widget/increment_decrement.dart';
import 'package:pc_mart/view/screen/cart/widget/no_cart_data_found.dart';
import 'package:pc_mart/view/screen/notification/notification.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    Size size = MediaQuery.sizeOf(context);
    cartController.getCartProductList();
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: SizedBox(
            height: 40, width: 150, child: Image.asset("images/pcmart.jpg")),
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
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Obx(
            () => cartController.isLoading.isTrue
                ? const CustomOrderShimmer()
                : cartController.cartProductList.isEmpty
                    ? const NoCartProductFoundWidget()
                    : Column(
                        children: [
                          const Text(
                            "Shopping Cart",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  RichText(
                                      text: const TextSpan(children: [
                                    TextSpan(
                                        text: "Total Item :",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ])),
                                  Obx(
                                    () => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                          "${cartController.cartProductList.length}"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: size.height / 1.8,
                            child: Obx(
                              () => ListView.builder(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  shrinkWrap: true,
                                  itemCount:
                                      cartController.cartProductList.length,
                                  itemBuilder: (_, index) {
                                    var data =
                                        cartController.cartProductList[index];
                                    double salePrice = 0.0;
                                    if (data.discountPrice != 0) {
                                      if (data.discountType == 0) {
                                        salePrice = (data.salePrice! -
                                            double.parse(
                                                data.discountPrice.toString()));
                                      } else if (data.discountType == 1) {
                                        salePrice = (data.salePrice! -
                                            (double.parse(data.discountPrice
                                                        .toString()) /
                                                    100) *
                                                data.salePrice!);
                                      } else {
                                        salePrice = 0.00;
                                      }
                                    } else {
                                      salePrice = double.parse(
                                          data.salePrice.toString());
                                    }
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      cartController.priceList[index] =
                                          salePrice * data.quantity!;
                                      cartController.totalPrice.value = 0.00;
                                      for (int i = 0;
                                          i < cartController.priceList.length;
                                          i++) {
                                        cartController.totalPrice.value +=
                                            cartController.priceList[i];
                                      }
                                    });
                                    return Card(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      surfaceTintColor: Colors.transparent,
                                      shape: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.withOpacity(.3),
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: SizedBox(
                                                height: size.height / 7,
                                                width: size.width / 5,
                                                child: Image.asset(
                                                    "${cartController.cartProductList[index].productImage}"),
                                              )),
                                          Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "${cartController.cartProductList[index].productName?.en}"),
                                                  Row(
                                                    children: [
                                                      Obx(
                                                        () => RichText(
                                                            text: TextSpan(
                                                                children: [
                                                                  const TextSpan(
                                                                      text:
                                                                      "Unit Price:",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                                  TextSpan(
                                                                      text:
                                                                      "${cartController.qty.value * salePrice}TK",
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .black))
                                                                ])),
                                                      ),
                                                      const Spacer(),
                                                      InkWell(
                                                        onTap: () async {
                                                          cartController
                                                              .cartProductList
                                                              .removeAt(index);
                                                        },
                                                        child: const Icon(
                                                            Icons
                                                                .delete_forever,
                                                            color: Colors.red),
                                                      ),
                                                      const SizedBox(width: 10)
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                IncrementDecrementButton(
                                                    iconData: Icons.add,
                                                    onTap: () async {
                                                      cartController
                                                          .qty.value++;
                                                    }),
                                                Obx(() => Text(
                                                    "${cartController.qty.value}")),
                                                IncrementDecrementButton(
                                                    iconData: Icons.remove,
                                                    onTap: () async {
                                                      if (cartController
                                                              .qty.value >
                                                          1) {
                                                        cartController
                                                            .qty.value--;
                                                      } else {
                                                        await EasyLoading.showError(
                                                            "Minimum quantity should be 1");
                                                      }
                                                    }),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => cartController.cartProductList.isEmpty
            ? const SizedBox()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    color: const Color(0xff9a0000),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: "Total Amount",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ])),
                          Obx(() => Text("= ${cartController.totalPrice.obs}Tk",
                              style: const TextStyle(color: Colors.white))),
                        ],
                      ),
                    ),
                  ),
                  CommonButton(
                    buttonWidth: size.width / 2,
                    buttonName: "Check Out",
                    onTap: () async {
                      Map<String, dynamic> data =
                          await cartController.orderService();
                      log("$data");
                      Get.to(() => const OrderInfo(), arguments: data);
                    },
                  ),
                  const SizedBox(height: 150)
                ],
              ),
      ),
    );
  }
}
