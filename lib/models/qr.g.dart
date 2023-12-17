// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QRData _$QRDataFromJson(Map<String, dynamic> json) => QRData(
      merchantId: json['merchant_id'] as String,
      menuUrl: json['menu_url'] as String,
    );

Map<String, dynamic> _$QRDataToJson(QRData instance) => <String, dynamic>{
      'merchant_id': instance.merchantId,
      'menu_url': instance.menuUrl,
    };

QRResponse _$QRResponseFromJson(Map<String, dynamic> json) => QRResponse(
      orderSession: json['order_session'] as String,
      data: QRData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QRResponseToJson(QRResponse instance) =>
    <String, dynamic>{
      'order_session': instance.orderSession,
      'data': instance.data,
    };
