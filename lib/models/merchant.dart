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

@JsonSerializable(fieldRename: FieldRename.snake)
class Menu {
  final int id;
  final String priceDisplay;
  final String basePriceDisplay;
  final String name;
  final String price;
  final String currency;
  final bool inStock;
  final String code;
  final String merchant;
  final String? parent;
  final List<String> category;

  Menu({
    required this.id,
    required this.priceDisplay,
    required this.basePriceDisplay,
    required this.name,
    required this.price,
    required this.currency,
    required this.inStock,
    required this.code,
    required this.merchant,
    this.parent,
    required this.category,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MenuResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Menu> results;

  MenuResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MenuResponseToJson(this);
}
