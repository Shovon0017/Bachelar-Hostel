import 'dart:developer';
import 'dart:ffi';

import 'package:bachelar_hostel/model/hostelListModel.dart';
import 'package:get/get.dart';

import '../api-controller/HostelListService.dart';


class HomeController extends GetxController {
  List<Hostel> finalHostelList = [];
  List<Hostel> hostelList = [];
  RxList<Hostel> cardProductList = <Hostel>[].obs;
  RxBool isLoading = false.obs;
  getProduct() async {
    finalHostelList= await HostelListService.hostelListService();
    isLoading.value = true;
    hostelList.addAll(finalHostelList);
    log("=============finalProductList 1: ${finalHostelList.length}");
    log("=============finalProductList 2: ${finalHostelList.length}");
    log("=============productList 1: ${hostelList.length}");
    isLoading.value = false;
  }

  searchFunction({required String searchText}) async {
    isLoading.value = true;
    log("-------------- $searchText");
    hostelList = finalHostelList
        .where((value) =>
    value.name!.toLowerCase().contains(searchText.toLowerCase())  ||
        value.address.toString().contains(searchText))
        .toList();
    log("=================Data : ${hostelList.length}");
    isLoading.value = false;
  }

  @override
  void onInit() {
    getProduct();

    super.onInit();
  }
}