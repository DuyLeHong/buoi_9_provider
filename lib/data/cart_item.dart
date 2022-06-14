import 'dart:math';

import 'package:ex6/data/product.dart';
import 'package:flutter/foundation.dart';

class CartItem extends ChangeNotifier {
  final int _id;
  final Product product;
  int _quantity = 1;

  void changeQuantity(int quantity) {
    _quantity += quantity;
    notifyListeners();
  }

  int get quantity => _quantity;

  double get totalPrice => product.price * _quantity;

  int get id => _id;

  CartItem({required this.product}) : _id = Random().nextInt(100);
}
