import 'package:flutter/cupertino.dart';
import 'package:tika_store/models/category.dart';
import 'package:tika_store/models/product.dart';
import 'package:tika_store/services/product_request.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryModel _categories = CategoryModel();
  ProductModel _products = ProductModel();
  final ScrollController _scrollController = ScrollController();
  int? _oldCategory;
  int _currentSlider = 0;
  int _currentPage = 1;
  bool _loadingProduct = false;
  final bool _loadSuccess = false;

  CategoryModel get categories => _categories;
  ProductModel get products => _products;
  ScrollController get scrollController => _scrollController;
  int? get oldCategory => _oldCategory;
  int get currentSlider => _currentSlider;
  bool get loadingProduct => _loadingProduct;
  bool get loadSuccess => _loadSuccess;

  CategoryProvider() {
    _scrollController.addListener(onScroll);
  }

  Future getProductOfCategory(idCategory) async {
    _loadingProduct = true;
    if (_oldCategory == null) {
      _oldCategory = idCategory;
    } else if (_oldCategory != idCategory) {
      _oldCategory = idCategory;
      _currentPage = 1;
    }
    final ProductModel? responseProducts =
        await ProductService.getProductOfCategory(_currentPage, idCategory);
    if (_currentPage == 1) {
      _products = responseProducts ?? ProductModel();
      _currentPage += 1;
      _loadingProduct = false;
      notifyListeners();
    } else if (_currentPage > 1 && _products.data!.data!.isNotEmpty) {
      _products.message = responseProducts?.message;
      _products.data?.data = [
        ...?_products.data?.data,
        ...?responseProducts?.data?.data
      ];
      _products.data?.currentPage = responseProducts?.data?.currentPage;
      _products.data?.firstPageUrl = responseProducts?.data?.firstPageUrl;
      _products.data?.lastPageUrl = responseProducts?.data?.lastPageUrl;
      _products.data?.lastPage = responseProducts?.data?.lastPage;
      _products.data?.nextPageUrl = responseProducts?.data?.nextPageUrl;
      _products.data?.path = responseProducts?.data?.path;
      _products.data?.perPage = responseProducts?.data?.perPage;
      _products.data?.total = responseProducts?.data?.total;
      _currentPage += 1;
      _loadingProduct = false;
      notifyListeners();
    }
  }

  // Scroll controller of customviewscroll
  void onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      if (_products.message == "Success") {
        if (_currentPage <= _products.data!.lastPage!) {
          _loadingProduct = false;
          getProductOfCategory(_oldCategory);
        }
        if (_currentPage == _products.data!.lastPage) {
          _loadingProduct = true;
        }
      }
      notifyListeners();
    }
    notifyListeners();
  }

  void onChangeSlider(value) {
    _currentSlider = value;
    notifyListeners();
  }
}
