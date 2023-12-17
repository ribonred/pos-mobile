// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      id: json['id'] as int,
      quantity: json['quantity'] as int,
      product: json['product'] as int,
      total: json['total'] as String,
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'product': instance.product,
      'total': instance.total,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      uid: json['uid'] as String,
      paid: json['paid'] as bool,
      cancelled: json['cancelled'] as bool,
      merchant: json['merchant'] as String,
      orderTotal: json['order_total'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'uid': instance.uid,
      'paid': instance.paid,
      'cancelled': instance.cancelled,
      'merchant': instance.merchant,
      'order_total': instance.orderTotal,
      'items': instance.items,
    };

WebsocketUpdate _$WebsocketUpdateFromJson(Map<String, dynamic> json) =>
    WebsocketUpdate(
      action: $enumDecode(_$UpdateActionEnumMap, json['action']),
      responseStatus: json['response_status'] as int,
      requestId: json['request_id'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$WebsocketUpdateToJson(WebsocketUpdate instance) =>
    <String, dynamic>{
      'action': _$UpdateActionEnumMap[instance.action]!,
      'response_status': instance.responseStatus,
      'request_id': instance.requestId,
      'data': instance.data,
    };

const _$UpdateActionEnumMap = {
  UpdateAction.update: 'update',
  UpdateAction.subscribeInstance: 'subscribe_instance',
};
