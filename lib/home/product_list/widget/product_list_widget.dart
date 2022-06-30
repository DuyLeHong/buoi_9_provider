import 'package:ex6/home/product_list/product_list_state.dart';
import 'package:flutter/material.dart';

import '../../../data/product.dart';
import '../../../detail/detail_product_screen.dart';
import '../widget/product_item_widget.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({Key? key, required this.onCartUpdated})
      : super(key: key);

  final VoidCallback onCartUpdated;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: productList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (_, index) {
          Product p = productList[index];
          return ProductItem(
            product: p,
            press: (product) async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailProductScreen(
                    product: p,
                  ),
                ),
              );
              onCartUpdated();
            },
          );
        },
      ),
    );
  }
}
