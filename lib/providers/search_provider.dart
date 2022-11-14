import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tika_store/models/product.dart';
import 'package:tika_store/services/search_request.dart';

class SearchProvider extends ChangeNotifier {
  ProductModel _products = ProductModel();
  ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int _currentPage = 1;
  bool _loadingProduct = false;
  List<String> _historySearch = [];

  ProductModel get products => _products;
  ScrollController get scrollController => _scrollController;
  TextEditingController get searchController => _searchController;
  GlobalKey<FormState> get formKey => _formKey;
  bool get loadingProduct => _loadingProduct;
  List<String> get historySearch => _historySearch;

  // Get home products
  Future getProducts() async {
    _loadingProduct = false;
    final searchKey = <String, String>{
      "productName": _searchController.text,
    };

    if (searchKey['productName'] == "") {
      Fluttertoast.showToast(msg: "Please enter a product name to search");
      return 0;
    }else if(_historySearch.isEmpty){
      _products = ProductModel();
      _historySearch.add(searchKey['productName']!);
      _currentPage = 1;
    }else if(_historySearch.isNotEmpty && _historySearch.last != searchKey['productName']!){
      _products = ProductModel();
      _historySearch.add(searchKey['productName']!);
      _currentPage = 1;
    }

    final ProductModel? responseProducts = await SearchService.searchProducts(_currentPage, searchKey);
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
      print("$searchKey -- $_currentPage -- $_historySearch");
    }
  }

  Future searchProducts() async {
    _loadingProduct = false;
    final searchKey = <String, String>{
      "productName": _searchController.text,
    };
    final ProductModel? responseProducts =
        await SearchService.searchProducts(_currentPage, searchKey);
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

  Future testRun() async {
    print(_searchController.text);
  }

  @override
  void dispose() {
    _searchController.clear();
    _scrollController.dispose();
    _searchController.dispose();
    notifyListeners();
    super.dispose();
  }
}
