import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Menu {
  final int id;
  final List<String> images;
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
    required this.images,
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
