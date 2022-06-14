import 'package:flutter/material.dart';

import '../../data/product.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  final Function(Product) press;

  const ProductItem({Key? key, required this.product, required this.press})
      : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    var p = widget.product;
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        widget.press(widget.product);
        // setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    child: Image.network(
                      p.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        p.category,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black12,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: '\$${p.price}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.baseline,
                              baseline: TextBaseline.alphabetic,
                              child: SizedBox(width: 10),
                            ),
                            TextSpan(
                              text: '\$${p.rootPrice}',
                              style: const TextStyle(
                                fontSize: 13,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  )
                ],
              ),
              Positioned(
                top: 5,
                right: -10,
                child: ElevatedButton(
                  child: p.isFavorite
                      ? const Icon(Icons.favorite, color: Colors.red)
                      : const Icon(Icons.favorite_border),
                  onPressed: () {
                    p.isFavorite = !p.isFavorite;
                    // setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    primary: Colors.grey.shade600,
                  ),
                ),
                // child: Ink(
                //   child: IconButton(
                //     icon: p.isFavorite
                //         ? const Icon(
                //             Icons.favorite,
                //             color: Colors.red,
                //           )
                //         : const Icon(Icons.favorite_border),
                //     color: Colors.white,
                //     disabledColor: Colors.grey,
                //     onPressed: () {
                //       p.isFavorite = !p.isFavorite;
                //       setState(() {});
                //     },
                //   ),
                //   decoration: const ShapeDecoration(
                //     color: Colors.grey,
                //     shape: CircleBorder(),
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class ProductItem extends StatelessWidget {
//   const ProductItem({Key? key, required this.product, required this.press})
//       : super(key: key);
//   final Product product;
//   final Function(Product) press;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         press(product);
//       },
//       child: Container(
//         color: Colors.black12,
//         height: 100,
//         width: 100,
//       ),
//     );
//   }
// }
