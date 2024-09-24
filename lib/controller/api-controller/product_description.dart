import 'dart:convert';
import 'package:flutter/material.dart';

import '../../database/productInfo.dart';
import '../../model/productInfoModel.dart';
class ProductInfoService {
  static Future<ProductInfoModel?> productInfoService({required String id}) async {
    try {
      ProductInfoModel descriptionModel = ProductInfoModel.fromJson(jsonDecode(jsonEncode(ProductInfoData.productInfoData)));
      return descriptionModel;
    } catch (e) {
      debugPrint("Error : $e");
    }
    return null;
  }
}
