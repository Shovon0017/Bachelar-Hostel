
import 'dart:convert';
import 'dart:developer';


import '../../database/productList.dart';
import '../../model/productListModel.dart';

class ProductListService{
  static Future<List<Products>> productListService()async{
    log("+++++++++");
    try{
      ProductLIstModel allproduct=ProductLIstModel.fromJson(jsonDecode(jsonEncode(ProductList.productlist)));
      log("${allproduct.products}");
      return allproduct.products??[];
    }
    catch(e){
      log("error:$e");
    }
    return[];

  }
}