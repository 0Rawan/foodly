
import 'package:dofd_user_panel/models/categories_model.dart';
import 'package:get/get.dart';

import '../data/repository/categories_repo.dart';
import '../utils/colors.dart';

class CategoriesController extends GetxController {
  final CategoriesRepo categoriesRepo;

  CategoriesController({required this.categoriesRepo});

  List<dynamic> _categoriesList = [];

  List<dynamic> get categoriesList => _categoriesList;


  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;


  Future<void> getCategoriesList() async {
    Response response = await categoriesRepo.getCategories();
    if (response.statusCode == 200) {
      _categoriesList = [];
      _categoriesList.addAll(Category.fromJson(response.body).categories);
      _isLoaded = true;
      update();
    } else {}
  }


}
