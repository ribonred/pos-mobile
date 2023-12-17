import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'websocket.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum UpdateAction {
  update,
  subscribeInstance,
}

@JsonSerializable()
class WebsocketOrderItem {
  final int id;
  final int quantity;
  final int product;
  final String total;

  WebsocketOrderItem({
    required this.id,
    required this.quantity,
    required this.product,
    required this.total,
  });

  factory WebsocketOrderItem.fromJson(Map<String, dynamic> json) {
    return _$WebsocketOrderItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WebsocketOrderItemToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WebsocketOrder {
  final String uid;
  final bool paid;
  final bool cancelled;
  final String merchant;
  final String orderTotal;
  final List<WebsocketOrderItem> items;

  WebsocketOrder({
    required this.uid,
    required this.paid,
    required this.cancelled,
    required this.merchant,
    required this.orderTotal,
    required this.items,
  });

  factory WebsocketOrder.fromJson(Map<String, dynamic> json) {
    return _$WebsocketOrderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WebsocketOrderToJson(this);
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

  factory WebsocketUpdate.fromJsonString(String json) {
    return WebsocketUpdate.fromJson(jsonDecode(json));
  }

  factory WebsocketUpdate.fromJson(Map<String, dynamic> json) {
    return _$WebsocketUpdateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WebsocketUpdateToJson(this);
}
