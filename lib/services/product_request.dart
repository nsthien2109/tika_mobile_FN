// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/models/category.dart';
import 'package:tika_store/models/product.dart';

class ProductService {

  static Future<CategoryModel?> getCategories() async {
    final response = await http.get(Uri.parse('$domain/categories'));
    if (response.statusCode == 200) {
      final categoryResponse = json.decode(response.body);
      final categoryData = categoryResponse['data'] as List<dynamic>;
      final List<DataCategory> categories = [];
      categoryData.forEach((category) => {
            categories.add(DataCategory(
                idCategory: category['id_category'],
                categoryName: category['categoryName'],
                categoryDescription: category['categoryDescription'],
                categoryImage: category['categoryImage'],
                numProducts: category['numProducts'],
              )
            )
          });
      return CategoryModel(message: categoryResponse['message'], data: categories);
    } else {
      final categoryResponse = json.decode(response.body);
      return CategoryModel(message: categoryResponse['message'], data: []);
    }
  }


  static Future<ProductModel?> getProducts(page) async {
    final response = await http.get(Uri.parse('$domain/products?page=$page'));
    if (response.statusCode == 200) {
      final productResponse = json.decode(response.body);
      
      return ProductModel();
    } else {
      final categoryResponse = json.decode(response.body);
      return ProductModel();
    }
  }
}
