
import 'package:bachelar_hostel/model/hostelInfoModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api-controller/hostel_description.dart';
class HostelInfoController extends GetxController {
  RxInt selectedImgIndex = 0.obs;
  List<Hostel> hostelInfo = [];
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
    isLoading.value = true; // Start loading
    id = Get.arguments ?? "0"; // Get hostel ID from arguments

    var response = await HostelInfoService.hostelInfoService(id: id); // Fetch data

    if (response.isNotEmpty) { // Check if response is not empty
      imageList.clear(); // Clear previous images
      detailsData.value = {
        "rating": response[0].number,
        "review": response[0].price,
        "description":response[0].description,
      };
    }
    isLoading.value = false;
  }

  addToCartProduct({required int productID, required int qty}) async {
    Get.back();
  }
}
