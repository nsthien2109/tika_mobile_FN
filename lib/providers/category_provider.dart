import 'package:flutter/cupertino.dart';
import 'package:tika_store/models/category.dart';
import 'package:tika_store/services/category_request.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryModel _categories = CategoryModel();
  int _currentSlider = 0;

  CategoryModel get categories => _categories;
  int get currentSlider => _currentSlider;

  CategoryProvider() {
    getCategories();
  }

  Future getCategories() async {
    final CategoryModel? categories = await CategoryService.getCategories();
    _categories = categories ?? CategoryModel();
    notifyListeners();
  }

  void onChangeSlider(value) {
    _currentSlider = value;
    notifyListeners();
  }
}
