import 'package:json_annotation/json_annotation.dart';

part 'merchant.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class QRData {
  final String merchantId;
  final String menuUrl;

  QRData({
    required this.merchantId,
    required this.menuUrl,
  });

  factory QRData.fromJson(Map<String, dynamic> json) {
    return _$QRDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QRDataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class QRResponse {
  final String orderSession;
  final QRData data;

  QRResponse({
    required this.orderSession,
    required this.data,
  });

  factory QRResponse.fromJson(Map<String, dynamic> json) {
    return _$QRResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QRResponseToJson(this);
}
