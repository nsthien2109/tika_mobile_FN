import 'package:flutter/cupertino.dart';
import 'package:tika_store/models/category.dart';
import 'package:tika_store/models/product.dart';
import 'package:tika_store/services/product_request.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryModel _categories = CategoryModel();
  ProductModel _products = ProductModel();
  ScrollController _scrollController = ScrollController();
  int? _oldCategory = null;
  int _currentSlider = 0;
  int _currentPage = 1;
  bool _loadingProduct = false;

  CategoryModel get categories => _categories;
  ProductModel get products => _products;
  ScrollController get scrollController => _scrollController;
  int? get oldCategory => _oldCategory;
  int get currentSlider => _currentSlider;
  bool get loadingProduct => _loadingProduct;


  Future getProductOfCategory(idCategory) async {
    _loadingProduct = false;
    if(_oldCategory == null){
      _oldCategory = idCategory;
    }else if(_oldCategory != idCategory){
      _oldCategory = idCategory;
      _currentPage = 1;
    }    
    final ProductModel? responseProducts = await ProductService.getProductOfCategory(_currentPage,idCategory);
    if (_currentPage == 1) {
      _products = responseProducts ?? ProductModel();
      _currentPage += 1;
      _loadingProduct = true;
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
      _loadingProduct = true;
      notifyListeners();
    }
  }

  void onChangeSlider(value) {
    _currentSlider = value;
    notifyListeners();
  }
}
