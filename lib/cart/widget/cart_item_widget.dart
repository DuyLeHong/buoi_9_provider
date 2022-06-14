import 'package:ex6/data/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart_state.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    print('hoan.dv: build cart Item');

    // var cartItem = context.watch<CartItem>();
    // var product = cartItem.product;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: ClipRRect(
              child: Selector<CartItem, String>(
                selector: (_, cartItem) => cartItem.product.img,
                builder: (_, img, __) {
                  return Image.network(
                    img,
                    fit: BoxFit.cover,
                  );
                },
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Selector<CartItem, String>(
                          selector: (_, cartItem) => cartItem.product.name,
                          builder: (_, name, __) {
                            return Text(
                              name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          final cartItem = context.read<CartItem>();
                          final cartState = context.read<CartState>();
                          cartState.removeCartItem(cartItem);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Selector<CartItem, double>(
                    selector: (_, cartItem) => cartItem.product.price,
                    builder: (_, price, ___) {
                      return Text.rich(
                        TextSpan(
                          text: 'Price:',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                              text: '\$$price',
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Selector<CartItem, double>(
                      builder: (_, totalPrice, __) {
                        return Text.rich(
                          TextSpan(
                            text: 'Sub Total:',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                            children: [
                              TextSpan(
                                text: '\$$totalPrice',
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      selector: (_, cartItem) => cartItem.totalPrice),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Ships Free',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () async {
                          final cartItem = context.read<CartItem>();
                          if (cartItem.quantity > 0) {
                            Provider.of<CartState>(context, listen: false)
                                .changeProductNumber(cartItem.id, -1);
                          }
                        },
                        icon: const Icon(Icons.remove, color: Colors.red),
                      ),
                      Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Selector<CartItem, int>(
                            selector: (_, cartItem) => cartItem.quantity,
                            builder: (_, quantity, __) {
                              return Text(
                                '$quantity',
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          final cartItem = context.read<CartItem>();
                          Provider.of<CartState>(context, listen: false)
                              .changeProductNumber(cartItem.id, 1);
                        },
                        icon: const Icon(Icons.add, color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
