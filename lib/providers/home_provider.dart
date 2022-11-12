import 'package:flutter/cupertino.dart';
import 'package:tika_store/models/banner.dart';
import 'package:tika_store/models/category.dart';
import 'package:tika_store/models/product.dart';
import 'package:tika_store/services/banner_request.dart';
import 'package:tika_store/services/category_request.dart';
import 'package:tika_store/services/product_request.dart';

class HomeProvider extends ChangeNotifier {
  ProductModel _products = ProductModel();
  CategoryModel _categories = CategoryModel();
  BannerModel _banners = BannerModel();
  int _currentSlider = 0;
  ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  bool _loadingProduct = false;

  ProductModel get products => _products;
  int get currentPage => _currentPage;
  ScrollController get scrollController => _scrollController;
  bool get loadingProduct => _loadingProduct;
  CategoryModel get categories => _categories;
  int get currentSlider => _currentSlider;
  BannerModel get banners => _banners;

  // initialize state
  HomeProvider() {
    getBanners();
    getCategories();
    getProducts();
    _scrollController.addListener(onScroll);
  }

  // Get home categories
  Future getCategories() async {
    final CategoryModel? categories = await CategoryService.getCategories();
    _categories = categories ?? CategoryModel();
    notifyListeners();
  }

  // Get home banner
  Future getBanners() async {
    final BannerModel? banner = await BannerService.getBanners();
    _banners = banner ?? BannerModel();
    notifyListeners();
  }

  // onchange slideshow
  void onChangeSlider(value) {
    _currentSlider = value;
    notifyListeners();
  }

  // Get home products
  Future getProducts() async {
    _loadingProduct = false;
    final ProductModel? responseProducts =
        await ProductService.getProducts(_currentPage);
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

  // refresh data
  Future refreshData() async {
    _products = ProductModel();
    _categories = CategoryModel();
    _banners = BannerModel();
    _currentPage = 1;
    notifyListeners();
    await getBanners();
    await getCategories();
    await getProducts();
  }

  // Scroll controller of customviewscroll
  void onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      if (_products.message == "Success") {
        if (_currentPage <= _products.data!.lastPage!) {
          _loadingProduct = false;
          getProducts();
        }
        if (_currentPage == _products.data!.lastPage) {
          _loadingProduct = true;
        }
      }
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    notifyListeners();
    super.dispose();
  }
}
