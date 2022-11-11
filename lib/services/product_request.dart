// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/models/product.dart';

class ProductService {

  static Future<ProductModel?> getProducts(page) async {
    final response = await http.get(Uri.parse('$domain/products?page=$page'));
    if (response.statusCode == 200) {
      final productResponse = json.decode(response.body);
      final productData = productResponse['data']['data'] as List<dynamic>;
      final List<DataProduct> products = [];
      productData.forEach((product) => {
        products.add(DataProduct(
          idProduct: product['id_product'],
          productName: product['productName'],
          productPrice: product['productPrice'],
          productImage: product['productImage'],
          productDescription: product['productDescription'],
          productAmount: product['productAmount'],
          discount: product['discount'],
          comments: product['comments'],
          brandName: product['brandName'],
          categoryName: product['categoryName'],
          idBrand: product['id_brand'],
          idCategory: product['id_category'],
          idStore: product['id_store'],
          idSubCategory: product['id_sub_category'],
          subCategoryName: product['subCategoryName'],
          likes: product['likes'],
          numProducts: product['numProducts'],
          purchases: product['purchases'],

        ))
      });
      return ProductModel(
          message: productResponse['message'],
          data: DataProductPage(
            data: products,
            currentPage: productResponse['data']['current_page'],
            firstPageUrl: productResponse['data']['first_page_url'],
            lastPage: productResponse['data']['last_page'],
            nextPageUrl: productResponse['data']['next_page_url'],
            perPage: productResponse['data']['per_page'],
            lastPageUrl: productResponse['data']['last_page_url'],
            path: productResponse['data']['path'],
            total: productResponse['data']['total']
            )
          );
    } else {
      final productResponse = json.decode(response.body);
      return ProductModel(message: productResponse['message']);
    }
  }
}
