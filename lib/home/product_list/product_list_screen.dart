import 'package:ex6/cart/cart_state.dart';
import 'package:ex6/home/product_list/widget/product_list_widget.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ProductListPage> {
  @override
  void initState() {
    FirebaseAnalytics.instance.setCurrentScreen(screenName: 'HomeScreen');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('hoan.dv: build home screen');

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Home Screen',
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: ElevatedButton(
                  child: const Icon(Icons.shopping_cart),
                  onPressed: () async {
                    await Navigator.pushNamed(context, '/cart_page');
                    // setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    primary: Colors.grey.shade600,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Consumer<CartState>(
                    builder: (_, cartState, __) {
                      return Text(
                        '${cartState.cartItemList.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ProductListWidget(
        onCartUpdated: () {
          // setState(() {});
        },
      ),
    );
  }
}
