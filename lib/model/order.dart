import 'package:krispy_store/classes/utils/order_status.dart';
import 'package:krispy_store/model/order_item.dart';

class Order {
  final int id;
  final List<OrderItem> orderItems;
  final double totalAmount;
  final int totalNumOfOrderItems;
  OrderStatus status;
  Order(
      {required this.id,
      required this.orderItems,
      required this.totalAmount,
      required this.totalNumOfOrderItems,
      required this.status});
}
