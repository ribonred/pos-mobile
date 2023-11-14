import 'dart:convert';

class QRResponse {
  final String orderSession;
  final Data data;

  QRResponse({
    required this.orderSession,
    required this.data,
  });

  factory QRResponse.fromRawJson(String str) =>
      QRResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QRResponse.fromJson(Map<String, dynamic> json) => QRResponse(
        orderSession: json["order_session"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "order_session": orderSession,
        "data": data.toJson(),
      };
}

class Data {
  final String merchantId;
  final String menuUrl;

  Data({
    required this.merchantId,
    required this.menuUrl,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        merchantId: json["merchant_id"],
        menuUrl: json["menu_url"],
      );

  Map<String, dynamic> toJson() => {
        "merchant_id": merchantId,
        "menu_url": menuUrl,
      };
}

class MenuResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Menu> menus;

  MenuResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.menus,
  });

  factory MenuResponse.fromRawJson(String str) =>
      MenuResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MenuResponse.fromJson(Map<String, dynamic> json) => MenuResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        menus: List<Menu>.from(json["results"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(menus.map((x) => x.toJson())),
      };
}

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
    required this.parent,
    required this.category,
  });

  factory Menu.fromRawJson(String str) => Menu.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        priceDisplay: json["price_display"],
        basePriceDisplay: json["base_price_display"],
        name: json["name"],
        price: json["price"],
        currency: json["currency"],
        inStock: json["in_stock"],
        code: json["code"],
        merchant: json["merchant"],
        parent: json["parent"],
        category: List<String>.from(json["category"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price_display": priceDisplay,
        "base_price_display": basePriceDisplay,
        "name": name,
        "price": price,
        "currency": currency,
        "in_stock": inStock,
        "code": code,
        "merchant": merchant,
        "parent": parent,
        "category": List<dynamic>.from(category.map((x) => x)),
      };
}
