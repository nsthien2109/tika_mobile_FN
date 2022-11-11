import 'package:flutter/cupertino.dart';
import 'package:tika_store/models/category.dart';
import 'package:tika_store/models/product.dart';
import 'package:tika_store/services/category_request.dart';

class ProductProvider extends ChangeNotifier {
  ProductModel _products = ProductModel();
  int _currentPage = 1;

  ProductModel get products => _products;
  int get currentPage => _currentPage;

  ProductProvider() {
    getCategories();
  }

  Future getCategories() async {
    final CategoryModel? categories = await CategoryService.getCategories();
    notifyListeners();
  }

  void onChangeSlider(value) {
    notifyListeners();
  }
}
