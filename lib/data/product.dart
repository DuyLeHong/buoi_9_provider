import 'package:ex6/data/ingredient.dart';

class Product {
  final int id;
  final String img;
  final String name;
  final String category;
  final double price;
  final double rootPrice;
  bool isFavorite = false;
  final List<Ingredient> ingredients;
  final List<String> recipe;

  Product(
    this.id,
    this.img,
    this.name,
    this.category,
    this.price,
    this.rootPrice,
    this.isFavorite,
    this.ingredients,
    this.recipe,
  );
}
