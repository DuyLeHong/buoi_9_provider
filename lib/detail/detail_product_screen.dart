import 'package:ex6/cart/cart_state.dart';
import 'package:ex6/detail/widget/ingredient_widget.dart';
import 'package:ex6/detail/widget/step_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/product.dart';
import 'cart_icon.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  @override
  Widget build(BuildContext context) {
    print('hoan.dv: build Product detail');

    var product = widget.product;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Colors.grey.withOpacity(0.8),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.5,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: size.height * 0.5,
                        child: ClipRRect(
                          child: Image.network(
                            product.img,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: size.width,
                          padding: const EdgeInsets.all(30),
                          child: Text(
                            product.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.45,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.012),
                          const Text(
                            'Ingredients',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.18,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: product.ingredients.length,
                              itemBuilder: (context, index) {
                                var ingredient = product.ingredients[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(right: 20, top: 20),
                                  child:
                                      IngredientWidget(ingredient: ingredient),
                                );
                              },
                            ),
                          ),
                          const Text(
                            'Recipe',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.012,
                          ),
                          SizedBox(
                            height: size.width * 0.3,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: product.recipe.length,
                              itemBuilder: (context, index) {
                                var content = product.recipe[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: StepWidget(
                                      step: index + 1, content: content),
                                );
                              },
                            ),
                          ),

                          // SingleChildScrollView(
                          //   scrollDirection: Axis.vertical,
                          //   child: Column(
                          //     children: product.recipe.map((recipe) {
                          //       var index = product.recipe.indexOf(recipe);
                          //       return StepWidget(
                          //           step: index + 1, content: recipe);
                          //     }).toList(),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: ElevatedButton(
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                primary: Colors.grey.shade600,
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: ElevatedButton(
              child: product.isFavorite
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
              onPressed: () {
                product.isFavorite = !product.isFavorite;
                // setState(() {});
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                primary: Colors.grey.shade600,
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 80,
            child: Stack(
              children: [
                ElevatedButton(
                  child: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Provider.of<CartState>(context, listen: false)
                        .addToCart(product);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    primary: Colors.grey.shade600,
                  ),
                ),
                Positioned(
                  right: 8,
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
                    child: CartIcon(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
