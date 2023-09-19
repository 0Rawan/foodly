import 'package:dofd_user_panel/data/api/api_client.dart';
import 'package:dofd_user_panel/utils/app_constants.dart';
import 'package:get/get.dart';

class CategoriesRepo extends GetxService {
  final ApiClient apiClient ;

  CategoriesRepo({required this.apiClient });

  Future<Response> getCategories()  async{
    return await  apiClient.getData( AppConstants.CATEGORIES_URI);
  }

}