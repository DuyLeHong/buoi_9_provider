import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart_state.dart';
import 'cart_item_widget.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('hoan.dv: consumer cart list');

    return Consumer<CartState>(
      builder: (_, cartState, __) {
        print('hoan.dv: consumer cart list');
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cartState.cartItemList.length,
          itemBuilder: (context, index) {
            var cart = cartState.cartItemList[index];
            return ChangeNotifierProvider.value(
              value: cart,
              child: const CartItemWidget(),
            );
          },
        );
      },
    );
  }
}
