import 'package:foodly/apis/category_endpoint.dart';
import 'package:foodly/models/categories_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  RxString _category = ''.obs;
  RxString _title = ''.obs;

  var isLoading = false.obs;

  RxList<Category> categories = RxList<Category>();
  RxList<Category> allCategories = RxList<Category>();

  String get categoryValue => _category.value;
  set updateCategory(String value) {
    _category.value = value;
  }

  String get titleValue => _title.value;
  set updateTitle(String value) {
    _title.value = value;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await _getRandomCategories();
  }

  Future<void> _getRandomCategories() async {
    try {
      isLoading.value = true;
      http.Response response =
          await http.get(Uri.parse(CategoryEndpoint.GET_RANDOM));
      categories.value = categoryFromJson(response.body);
      print(categories.value);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getAllCategories() async {
    try {
      isLoading.value = true;
      http.Response response =
          await http.get(Uri.parse(CategoryEndpoint.GET_ALL));
      allCategories.value = categoryFromJson(response.body);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = true;
    }
  }
}
