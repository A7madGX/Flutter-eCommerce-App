// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:krispy_store/classes/utils/category.dart';
import 'package:krispy_store/model/product.dart';

abstract class UserService {
  static const String smartphones =
      "https://dummyjson.com/products/category/smartphones";
  static const String laptops =
      "https://dummyjson.com/products/category/laptops";
  static const String fragrances =
      "https://dummyjson.com/products/category/fragrances";
  static const String homeDecorations =
      "https://dummyjson.com/products/category/home-decoration";
  static const String skincare =
      "https://dummyjson.com/products/category/skincare";
  static const String groceries =
      "https://dummyjson.com/products/category/groceries";

  static Future<List<Product>> getProducts(MyCategoryType category) async {
    final List<Product> products = [];

    try {
      final response = await Dio().get(
          "https://dummyjson.com/products/category/${parseCategoryToUrl(category)}");
      var data = response.data;
      data["products"].forEach((jsonProduct) {
        Product product = Product.fromJson(jsonProduct);
        products.add(product);
      });
    } catch (e) {
      print("Catched errorrrrr");
      print(e.toString());
    }
    return products;
  }
}
