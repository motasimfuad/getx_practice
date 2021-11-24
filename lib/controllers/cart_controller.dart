import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  // double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  double get totalPrice => cartItems.fold(
      0, (previousValue, element) => previousValue + element.price);

  int get totalItems => cartItems.length;

  addToCart(Product product) {
    Get.snackbar(
      'Success',
      '${product.productName} is added to the cart.',
      backgroundColor: Colors.white,
      duration: Duration(seconds: 2),
      margin: EdgeInsets.all(10),
    );
    print(totalPrice);
    cartItems.add(product);
  }

  // on init
  @override
  void onInit() {
    super.onInit();
    print('totalPrice: $totalPrice');
  }

  @override
  void onClose() {
    super.onClose();
    print('totalPrice was: $totalPrice');
  }
}
