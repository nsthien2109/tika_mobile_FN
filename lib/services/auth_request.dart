import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/models/auth.dart';

class AuthService {

  static Future<AuthModel?> register(newAccountData) async { 
    try {
      final response = await http.post(
        Uri.parse("$domain/register"),
        headers : <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String ,String>{...newAccountData})
      );

      final userData = json.decode(response.body);

      if(response.statusCode == 200 && userData['message'] == "Register Successfully"){
        return AuthModel(
          message: userData['message'],
          data: DataUser(
            id: userData['data']['id'],
            email: userData['data']['email'],
            firstName: userData['data']['firstName'],
            lastName: userData['data']['lastName'],
            phone: userData['data']['phone'],
            role: userData['data']['role'],
            emailVerifiedAt: userData['data']['email_verified_at'],
          ),
          accessToken: userData['accessToken'],
          type: userData['type']
        );
      }else{
        final userData = json.decode(response.body);
        return AuthModel(message: userData['message']);
      }
    } catch (e) {
      debugPrint("ERROR SIGN UP : $e");
    }
  }


  static Future<AuthModel?> login(loginInfo) async {
    try {
      final response = await http.post(Uri.parse('$domain/login'),
      headers : <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body : jsonEncode(<String, String>{...loginInfo}),
      );
      if(response.statusCode == 200){
        final userData = json.decode(response.body);
        return AuthModel(
          message: userData['message'],
          data: DataUser(
            id: userData['data']['id'],
            email: userData['data']['email'],
            firstName: userData['data']['firstName'],
            lastName: userData['data']['lastName'],
            phone: userData['data']['phone'],
            role: userData['data']['role'],
            emailVerifiedAt: userData['data']['email_verified_at'],
          ),
          accessToken: userData['accessToken'],
          type: userData['type']
        );
      }else{
        final userData = json.decode(response.body);
        return AuthModel(message: userData['message']);
      }
    } catch (e) {
      debugPrint("ERROR SIGN UP : $e"); 
    }
  }

  static Future<AuthModel?> logout(token) async {
    final response = await http.get(Uri.parse('$domain/logout'),
      headers : <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      }
    );
    final userData = json.decode(response.body);
    return AuthModel(message: userData['message']);
  }

  static Future<AuthModel> updateUser(token, userData) async {
    try {
      final response = await http.post(
        Uri.parse("$domain/user-update"),
        headers : <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String ,String>{...userData})
      );
      if(response.statusCode == 200){
        final userResponseData = json.decode(response.body);
        return AuthModel(
          message: userResponseData['message'],
          data: DataUser(
            id: userResponseData['data']['id'],
            email: userResponseData['data']['email'],
            firstName: userResponseData['data']['firstName'],
            lastName: userResponseData['data']['lastName'],
            phone: userResponseData['data']['phone'],
            role: userResponseData['data']['role'],
            emailVerifiedAt: userResponseData['data']['email_verified_at'],
          ),
          accessToken: userResponseData['accessToken'],
          type: userResponseData['type']
        );
      }else{
        final userResponseData = json.decode(response.body);
        return AuthModel(message: userResponseData['message']);
      }
    } catch (e) {
      debugPrint("Auth service error: $e");
      return AuthModel(message: "Something went wrong");
    }
  }

}