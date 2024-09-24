
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api-controller/product_description.dart';
class HostelInfoController extends GetxController {
  RxInt selectedImgIndex = 0.obs;
  RxInt hostelQty = 1.obs;
  var detailsData = {}.obs;
  RxList<String> imageList = <String>[].obs;
  String id = "0";
  RxDouble hostelAmount = 0.00.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    HostelInfoFun();
    super.onInit();
  }

  HostelInfoFun() async {
    id = await Get.arguments ?? "0";
    var a = await ProductInfoService.productInfoService(id: id);
    if (a?.productDetails != null) {
      for (var i in a?.productDetails?.images ?? []) {
        imageList.add(i.toString());
      }

      var data = {
        "rating": a?.productDetails?.rating ?? "",
        "review": a?.productDetails?.review ?? "",
        "description": a?.productDetails?.description?.en ?? "",
      };
      detailsData.addAll(data);
    }
  }

  addToCartProduct({required int productID, required int qty}) async {
    Get.back();
  }
}
