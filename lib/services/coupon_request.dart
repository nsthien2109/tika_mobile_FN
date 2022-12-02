import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/models/coupon.dart';

class CouponService{
  
  static Future<CouponModel?> checkCoupon(couponCode) async {
    final response = await http.post(
      Uri.parse('$domain/check-coupon'),
      headers : <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String ,String>{...couponCode})
    );
    final couponResponse = json.decode(response.body);
    if(response.statusCode == 200 && couponResponse['message'] == 'Success') {
      return CouponModel(
        message: couponResponse['message'],
        data: DataCoupon(
          idCoupon: couponResponse['data']['id_coupon'],
          couponCode: couponResponse['data']['couponCode'],
          couponDescription: couponResponse['data']['couponDescription'],
          couponName: couponResponse['data']['couponName'],
          couponPercent: couponResponse['data']['couponPercent'],
          couponTurns: couponResponse['data']['couponTurns'],
          couponType: couponResponse['data']['couponType'],
          startTime: couponResponse['data']['start_time'],
          idStore: couponResponse['data']['id_store'],
          endTime: couponResponse['data']['end_time'],
        )
      );
    }
    else{
      return CouponModel();
    }
  }
}