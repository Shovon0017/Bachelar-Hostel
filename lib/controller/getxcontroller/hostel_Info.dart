
import 'package:bachelar_hostel/controller/api-controller/hostel_description.dart';
import 'package:bachelar_hostel/model/hostelInfoModel.dart';
import 'package:bachelar_hostel/model/hostelListModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HostelInfoController extends GetxController {
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

  Future<void> ProductInfoFun() async {
    String id = Get.arguments ?? "0";
    try {
      var response = await HostelInfoService.hostelInfoService(id: id);
      if (response?.hostelDetails != null) {
        imageList.addAll((response.hostelDetails.images ?? []).map((i) => i.toString()));

        var data = {
          "rating": response.hostelDetails.rating ?? "",
          "review": response.hostelDetails.review ?? "",
          "description": response.hostelDetails.description?.en ?? "",
        };
        detailsData.addAll(data);
      }
    } catch (error) {
      // Handle the error, e.g., show a message to the user
      print("Error fetching hostel info: $error");
    }
  }

  addToCartProduct({required int productID, required int qty}) async {
    Get.back();
  }
}

extension on List<Hosteldetails> {
  get hostelDetails => null;
}
