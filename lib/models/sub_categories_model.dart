import 'category_product.dart';

class SubCategory {
  int id;
  String title;
  int categoriesId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Product> products;

  SubCategory({
    required this.id,
    required this.title,
    required this.categoriesId,
    required this.createdAt,
    required this.updatedAt,
    required this.products,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    title: json["title"],
    categoriesId: json["categories_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "categories_id": categoriesId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}