
import 'package:get/get.dart';
import 'package:pc_mart/Model/CartProductShow.dart';
import 'package:pc_mart/controller/api%20service/cart_product.dart';

class CartController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ProductCart> cartProductList = <ProductCart>[].obs;
  RxInt qty = 1.obs;
  RxList<double> priceList = <double>[].obs;
  RxDouble totalPrice = 0.00.obs;

  getCartProductList() async {
    isLoading.value = true;
    var data = await CartProductListService.cartProductListService();
    isLoading.value = false;
    cartProductList.clear();
    cartProductList.value = data ?? [];
    priceList.clear();
    for (int i = 0; i < cartProductList.length; i++) {
      priceList.add(totalPrice.value);
    }
  }



  Future<Map<String, dynamic>> orderService() async {
    List productIDList = [];
    List productQTYList = [];
    List productPriceList = [];
    for (int i = 0; i < cartProductList.length; i++) {
      productIDList.add(cartProductList[i].productId);
      productQTYList.add(cartProductList[i].quantity);
      productPriceList.add(priceList[i]);
    }
    return {
      "total_product_price": totalPrice,
      "product_data": {"product_id": productIDList, "quantity": productQTYList, "price": productPriceList}
    };
  }

  @override
  void onInit() {
    getCartProductList();
    super.onInit();
  }
}
