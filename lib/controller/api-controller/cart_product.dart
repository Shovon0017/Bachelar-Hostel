import 'dart:convert';
import 'package:flutter/material.dart';

import '../../Common_widget/CommonSnackbar.dart';
import '../../database/AddtoCartdata.dart';
import '../../model/CartProductShow.dart';

class CartProductListService {
  static Future<List<ProductCart>?> cartProductListService() async {
    try {
        CartProductListModel data = CartProductListModel.fromJson(jsonDecode(jsonEncode(AddToCartData.addToCartData)));
        return data.productCart;
    } catch (e) {
      debugPrint("Error : $e");
    }
    CommonSnackBarMessage.errorMessage(text: "Something went wrong..!!");
    return [];
  }
}