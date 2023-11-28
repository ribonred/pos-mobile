// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      product: json['product'] as int,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      product: json['product'] as int,
      id: json['id'] as int,
      quantity: json['quantity'] as int,
      totalDisplay: json['total_display'] as String,
      productName: json['product_name'] as String,
      productPrice: json['product_price'] as String,
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'product': instance.product,
      'id': instance.id,
      'quantity': instance.quantity,
      'total_display': instance.totalDisplay,
      'product_name': instance.productName,
      'product_price': instance.productPrice,
    };

OrderResult _$OrderResultFromJson(Map<String, dynamic> json) => OrderResult(
      uid: json['uid'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDisplay: json['total_display'] as String,
    );

Map<String, dynamic> _$OrderResultToJson(OrderResult instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'items': instance.items,
      'total_display': instance.totalDisplay,
    };

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => OrderResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
