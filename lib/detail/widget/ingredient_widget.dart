import 'package:ex6/data/ingredient.dart';
import 'package:flutter/material.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({Key? key, required this.ingredient})
      : super(key: key);
  final Ingredient ingredient;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.012 * 8,
          width: size.height * 0.012 * 8,
          child: CircleAvatar(
            radius: 48,
            backgroundImage: NetworkImage(ingredient.img),
          ),
        ),
        SizedBox(
          height: size.height * 0.012,
        ),
        Text(
          ingredient.name,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
