// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/models/cart.dart';

class CartService {
  static Future<CartModel> getCart(token) async {
    final response = await http.get(
        Uri.parse('$domain/cart'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
        }
      );
    final cartResponse = json.decode(response.body);
    if (response.statusCode == 200 && cartResponse['message'] == 'Success') {
      final cartData = cartResponse['data'] as List<dynamic>;
      final List<DataCart> cartList = [];
      cartData.forEach((cart) => {
        cartList.add(DataCart(
          idCart: cart['id_cart'],
          idColor: cart['id_color'],
          idSize: cart['id_size'],
          idUser: cart['id_user'],
          idProduct: cart['id_product'],
          quantity: cart['quantity'],          
          productName: cart['productName'],
          productPrice: double.parse(cart['productPrice']),
          productImage: cart['productImage'],
          productDescription: cart['productDescription'],
          productAmount: cart['productAmount'],
          discount: cart['discount'],
          comments: cart['comments'],
          idBrand: cart['id_brand'],
          idCategory: cart['id_category'],
          idStore: cart['id_store'],
          idSubCategory: cart['id_sub_category'],
          likes: cart['likes'],
          purchases: cart['purchases'],
          )
        )
      });
      return CartModel(
        message: cartResponse['message'],
        data: cartList
      );
    } else {
      return CartModel(message: cartResponse['message']);
    }
  }

  static Future<int?> removeCart(token, idCart) async {
    // return id cart to delete in state cart provider
    try {
      final response = await http.delete(
        Uri.parse("$domain/remove-cart/$idCart"),
        headers : <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      final removeCartResponse = json.decode(response.body);
      if(response.statusCode == 200 && removeCartResponse['message'] == 'Success'){
        return removeCartResponse['data']['id_cart'];
      }else{
        return null;
      }
    } catch (e) {
      debugPrint("Remove cart service error : $e");
      return null;
    }
  }

  static Future<DataCart> addCart(cartData,token) async{
    try {
      final response = await http.post(
        Uri.parse("$domain/cart"),
        headers : <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String ,dynamic>{...cartData})
      );
      final cartResponse = json.decode(response.body);
      if (response.statusCode == 200 && cartResponse['message'] == 'Success') {
        return DataCart(
            idCart: cartResponse['id_cart'],
            idColor: cartResponse['id_color'],
            idSize: cartResponse['id_size'],
            idUser: cartResponse['id_user'],
            idProduct: cartResponse['id_product'],
            quantity: cartResponse['quantity'],          
            productName: cartResponse['productName'],
            productPrice: cartResponse['productPrice'],
            productImage: cartResponse['productImage'],
            productDescription: cartResponse['productDescription'],
            productAmount: cartResponse['productAmount'],
            discount: cartResponse['discount'],
            comments: cartResponse['comments'],
            idBrand: cartResponse['id_brand'],
            idCategory: cartResponse['id_category'],
            idStore: cartResponse['id_store'],
            idSubCategory: cartResponse['id_sub_category'],
            likes: cartResponse['likes'],
            purchases: cartResponse['purchases'],
        );
      } else {
        return DataCart();
      }
    } catch (e) {
      debugPrint("Add cart service error : $e");
      return DataCart();
    }
  }
}
