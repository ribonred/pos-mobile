import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final int product;
  final int quantity;

  Order({
    required this.product,
    required this.quantity,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return _$OrderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderItem {
  final int product;
  final int id;
  final int quantity;
  final String total;
  final String productName;
  final double productPrice;
  final String? productImage;

  OrderItem({
    required this.product,
    required this.id,
    required this.quantity,
    required this.total,
    required this.productName,
    required this.productPrice,
    this.productImage,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return _$OrderItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderResult {
  final String uid;
  final List<OrderItem> items;
  final String orderTotal;

  OrderResult({
    required this.uid,
    required this.items,
    required this.orderTotal,
  });

  factory OrderResult.fromJson(Map<String, dynamic> json) {
    return _$OrderResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderResultToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<OrderResult> results;

  OrderResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return _$OrderResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}
