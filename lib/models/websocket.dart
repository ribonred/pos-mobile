import 'package:json_annotation/json_annotation.dart';

part 'websocket.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum UpdateAction {
  update,
  subscribeInstance,
}

@JsonSerializable()
class OrderItem {
  final int id;
  final int quantity;
  final int product;
  final String total;

  OrderItem({
    required this.id,
    required this.quantity,
    required this.product,
    required this.total,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return _$OrderItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Order {
  final String uid;
  final bool paid;
  final bool cancelled;
  final String merchant;
  final String orderTotal;
  final List<OrderItem> items;

  Order({
    required this.uid,
    required this.paid,
    required this.cancelled,
    required this.merchant,
    required this.orderTotal,
    required this.items,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return _$OrderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WebsocketUpdate {
  final UpdateAction action;
  final int responseStatus;
  final String requestId;
  final dynamic data;

  WebsocketUpdate({
    required this.action,
    required this.responseStatus,
    required this.requestId,
    required this.data,
  });

  factory WebsocketUpdate.fromJson(Map<String, dynamic> json) {
    return _$WebsocketUpdateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WebsocketUpdateToJson(this);
}
