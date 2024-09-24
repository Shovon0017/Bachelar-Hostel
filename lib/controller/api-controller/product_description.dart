import 'dart:convert';
import 'package:flutter/material.dart';

import '../../database/hostelInfo.dart';
import '../../model/hostelInfoModel.dart';
class HostelInfoService {
  static Future<vv?> hostelInfoService({required String id}) async {
    try {
      ProductInfoModel descriptionModel = ProductInfoModel.fromJson(jsonDecode(jsonEncode(ProductInfoData.productInfoData)));
      return descriptionModel;
    } catch (e) {
      debugPrint("Error : $e");
    }
    return null;
  }
}
