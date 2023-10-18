import 'package:flutter/material.dart';
import 'package:krispy_store/model/product.dart';

class OrderItem {
  final Product product;
  int amount;
  final int size;
  final Color color;

  OrderItem({
    required this.product,
    required this.amount,
    required this.size,
    required this.color,
  });
}
