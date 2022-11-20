import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/models/address.dart';
import 'package:tika_store/models/auth.dart';
import 'package:tika_store/models/wishlist.dart';

class ProfileService {
  static Future<DataUser> getProfile(token) async {
    try {
      final response =
          await http.get(Uri.parse('$domain/user'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
      final userData = json.decode(response.body);
      if (response.statusCode == 200) {
        return DataUser(
          id: userData['data']['id'],
          email: userData['data']['email'],
          phone: userData['data']['phone'],
          firstName: userData['data']['firstName'],
          lastName: userData['data']['lastName'],
          role: userData['data']['role'],
        );
      }
      return DataUser();
    } catch (e) {
      debugPrint("Error get profile service : $e");
      return DataUser();
    }
  }

  static Future<AddressModel> getAddress(token) async {
    try {
      final response = await http.get(
        Uri.parse('$domain/address'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
        });
      final addressResponse = json.decode(response.body);
      if (response.statusCode == 200 && addressResponse['message'] == 'Success') {
        return AddressModel(
          message : addressResponse['message'],
          data: DataAddress(
            idUser: addressResponse['data']['id_user'], 
            idAddress: addressResponse['data']['id_address'],
            addressProvince: addressResponse['data']['addressProvince'],
            addressDistrict: addressResponse['data']['addressDistrict'],
            addressCommune: addressResponse['data']['addressCommune'],
            addressSpecific: addressResponse['data']['addressSpecific'],
            firstName: addressResponse['data']['firstName'],
            lastName: addressResponse['data']['lastName'],
            phone: addressResponse['data']['phone']
          )
        );
      }
      return AddressModel();
    } catch (e) {
      debugPrint("Error get address service : $e");
      return AddressModel();
    }
  }

  static Future<AddressModel> updateAddress(token,addressData) async {
    try {
      final response = await http.post(
        Uri.parse('$domain/address'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String ,String>{...addressData})
      );
      final addressResponse = json.decode(response.body);
      if (response.statusCode == 200 && addressResponse['message'] == 'Success') {
        return AddressModel(
          message : addressResponse['message'],
          data: DataAddress(
            idUser: addressResponse['data']['id_user'], 
            idAddress: addressResponse['data']['id_address'],
            addressProvince: addressResponse['data']['addressProvince'],
            addressDistrict: addressResponse['data']['addressDistrict'],
            addressCommune: addressResponse['data']['addressCommune'],
            addressSpecific: addressResponse['data']['addressSpecific'],
            firstName: addressResponse['data']['firstName'],
            lastName: addressResponse['data']['lastName'],
            phone: addressResponse['data']['phone']
          )
        );
      }
      return AddressModel();
    } catch (e) {
      debugPrint("Error get address service : $e");
      return AddressModel();
    }
  }

  static Future<WishListModel> getWishList(token) async {
    try {
      final response = await http.get(
        Uri.parse('$domain/favorite/my'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
        }
      );
      final wishlistResponse = json.decode(response.body);
      if (response.statusCode == 200 && wishlistResponse['data'].isNotEmpty) {
        final wishlistData = wishlistResponse['data'] as List<dynamic>;
        final List<DataWishList> wishlist = [];
        wishlistData.forEach((product) => {
          wishlist.add(DataWishList(
              idFavorite: product['id_favorite'],
              idProduct: product['id_product'],
              idUser: product['id_user'],
              productName: product['productName'],
              productImage: product['productImage'],
              productPrice: product['productPrice'],
              discount: product['discount'],
              productAmount: product['productAmount'],
              comments: product['comments'],
            )
          )
        });
        return WishListModel(
          message: wishlistResponse['message'],
          data: wishlist
        );
      }
      return WishListModel(message: "Wishlist not found");
    } catch (e) {
      debugPrint("Error get wish list service : $e");
      return WishListModel(message: "Some thing went wrong");
    }
  }
}
