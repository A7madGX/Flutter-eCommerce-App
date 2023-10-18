enum OrderStatus { pending, processing, shipping, delivered }

String statusToString(OrderStatus status) {
  switch (status) {
    case OrderStatus.pending:
      return "Pending";
    case OrderStatus.processing:
      return "Processing";
    case OrderStatus.shipping:
      return "Shipping";
    case OrderStatus.delivered:
      return "Delivered";
    default:
      return "Pending";
  }
}
