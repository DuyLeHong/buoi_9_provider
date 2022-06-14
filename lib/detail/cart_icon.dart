import 'dart:ui';

import 'package:ex6/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartState>();

    return Text(
      '${cartState.cartItemList.length}',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 8,
      ),
      textAlign: TextAlign.center,
    );
  }
}
