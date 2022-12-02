// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:tika_store/models/order_detail.dart';

class OrderService{

  static Future<OrderDetailModel> getOrderDetail(token, id) async{
    try {
      final response = await http.get(Uri.parse('$domain/order/$id'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
      final detailResponse = json.decode(response.body);
      final orderDetailData = detailResponse['data'] as List<dynamic>;
      final List<DataOrderDetail> orderItems = [];
      orderDetailData.forEach((order) => {
        orderItems.add(
          DataOrderDetail(
            idOrder: order['id_order'] as int,
            idUser: order['id_user'] as int,
            idColor: order['id_color'],
            idSize: order['id_size'],
            idProduct: order['id_product'] as int,
            idOrderDetail: order['id_order_detail'] as int,
            productImage: order['productImage'],
            productName: order['productName'],
            quantity: order['quantity'] as int,
            statusType: order['statusType'],
            total: (order['total'] ?? 0.0).toDouble(),
            addressProvince: order['addressProvince'],
            addressDistrict: order['addressDistrict'],
            addressCommune: order['addressCommune'],
            addressSpecific: order['addressSpecific'],
            orderName: order['orderName'],
            orderCoupon: order['orderCoupon'],
            orderEmail: order['orderEmail'],
            orderPhone: order['orderPhone'],
            orderDiscount: (order['orderDiscount'] ?? 0.0).toDouble(),
            orderNotes: order['orderNotes'],
            orderTotal: order['orderTotal'],
            paymentMethod: order['paymentMethod'],
            feeship: order['feeship'].toDouble(),
          )
        )
      });
      return OrderDetailModel(message:detailResponse['message'],data: orderItems);
    } catch (e) {
      debugPrint("Error get order detail service : $e");
      return OrderDetailModel(message: "Some thing went wrong");
    }
  }


  static Future<OrderModel> getOrders(token) async{
    try {
      final response = await http.get(Uri.parse('$domain/order'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
      final orderResponse = json.decode(response.body);
      final orderData = orderResponse['data'] as List<dynamic>;
      final List<DataOrder> orders = [];
      orderData.forEach((order) => {
        orders.add(
          DataOrder(
            idOrder: order['id_order'] as int,
            idUser: order['id_user'] as int,
            addressProvince: order['addressProvince'],
            addressDistrict: order['addressDistrict'],
            addressCommune: order['addressCommune'],
            addressSpecific: order['addressSpecific'],
            orderName: order['orderName'],
            orderCoupon: order['orderCoupon'],
            orderEmail: order['orderEmail'],
            orderPhone: order['orderPhone'],
            orderDiscount: (order['orderDiscount'] ?? 0.0).toDouble(),
            orderNotes: order['orderNotes'],
            orderTotal: order['orderTotal'],
            paymentMethod: order['paymentMethod'],
            feeship: order['feeship'].toDouble(),
          )
        )
      });
      return OrderModel(message: orderResponse['message'], data: orders);
    } catch (e) {
      debugPrint("Error get order service : $e");
      return OrderModel(message: "Some thing went wrong");
    }
  }
}