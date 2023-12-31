// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) => Menu(
      id: json['id'] as int,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
      price: json['price'] as String,
      currency: json['currency'] as String,
      inStock: json['in_stock'] as bool,
      code: json['code'] as String,
      merchant: json['merchant'] as String,
      parent: json['parent'] as String?,
      category:
          (json['category'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'price': instance.price,
      'currency': instance.currency,
      'in_stock': instance.inStock,
      'code': instance.code,
      'merchant': instance.merchant,
      'parent': instance.parent,
      'category': instance.category,
    };

MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) => MenuResponse(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Menu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuResponseToJson(MenuResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
