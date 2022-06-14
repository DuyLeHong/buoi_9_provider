import 'package:ex6/cart/widget/cart_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_state.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    print('hoan.dv: build cart screen');

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('My Cart'),
      ),
      body: const CartListScreen(),
      bottomSheet: Container(
        color: Colors.black12,
        padding: const EdgeInsets.only(top: 5),
        height: size.height / 6,
        width: size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Text(
                    'Checkout Price:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Consumer<CartState>(builder: (_, cartState, __) {
                    return Text(
                      'Rs. ${cartState.totalPrice}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Material(
                elevation: 1,
                color: Colors.red,
                child: InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Checkout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
