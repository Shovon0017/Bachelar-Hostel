
import 'package:bachelar_hostel/controller/api-controller/hostel_description.dart';
import 'package:bachelar_hostel/model/hostelListModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductInfoController extends GetxController {
  RxInt selectedImgIndex = 0.obs;
  RxInt productQty = 1.obs;
  var detailsData = {}.obs;
  RxList<String> imageList = <String>[].obs;
  String id = "0";
  RxDouble productAmount = 0.00.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    ProductInfoFun();
    super.onInit();
  }

  ProductInfoFun() async {
    id = await Get.arguments ?? "0";
    var a = await HostelInfoService.hostelInfoService(id: id);
    if (a?.hostelDetails != null) {
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
