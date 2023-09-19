import 'package:dofd_user_panel/models/products_model.dart';

class Category {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<CategoryModel> _categories;

  List<CategoryModel> get categories => _categories;
  Category(
      {required totalSize,
        required typeId,
        required offset,
        required categories}) {
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._categories = categories;
  }

  Category.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['categories'] != null) {
      _categories = <CategoryModel>[];
      json['categories'].forEach((v) {
        _categories.add(new CategoryModel.fromJson(v));
      });
    }
  }
}

class CategoryModel {
  int? id;
  String? title;
  String? description;
  String? img;
  ProductModel? product;

  CategoryModel(
      {this.id,
        this.title,
        this.description,
        this.img,
        this.product,
      });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    img = json['image'];
    product = json['product'];
  }



  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'image': this.img,
      'product': this.product,
    };
  }
}
