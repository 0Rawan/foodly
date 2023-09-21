
class Product {
  int id;
  String name;
  int status;
  int instock;
  int stock;
  double price;
  bool discount;
  String img;
  String slug;
  int storesId;
  int subCategoriesId;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.status,
    required this.instock,
    required this.stock,
    required this.price,
    required this.discount,
    required this.img,
    required this.slug,
    required this.storesId,
    required this.subCategoriesId,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    instock: json["instock"],
    stock: json["stock"],
    price: json["price"],
    discount: json["discount"],
    img: json["img"],
    slug: json["slug"],
    storesId: json["stores_id"],
    subCategoriesId: json["sub_categories_id"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "instock": instock,
    "stock": stock,
    "price": price,
    "discount": discount,
    "img": img,
    "slug": slug,
    "stores_id": storesId,
    "sub_categories_id": subCategoriesId,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}