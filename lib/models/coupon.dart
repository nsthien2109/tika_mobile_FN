class CouponModel {
  String? message;
  DataCoupon? data;

  CouponModel({this.message, this.data});

  CouponModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? DataCoupon.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataCoupon {
  int? idCoupon;
  String? couponName;
  String? couponDescription;
  String? couponCode;
  String? couponPercent;
  String? couponType;
  int? couponTurns;
  int? idStore;
  String? startTime;
  String? endTime;

  DataCoupon(
      {this.idCoupon,
      this.couponName,
      this.couponDescription,
      this.couponCode,
      this.couponPercent,
      this.couponType,
      this.couponTurns,
      this.idStore,
      this.startTime,
      this.endTime
      }
  );

  DataCoupon.fromJson(Map<String, dynamic> json) {
    idCoupon = json['id_coupon'];
    couponName = json['couponName'];
    couponDescription = json['couponDescription'];
    couponCode = json['couponCode'];
    couponPercent = json['couponPercent'];
    couponType = json['couponType'];
    couponTurns = json['couponTurns'];
    idStore = json['id_store'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_coupon'] = idCoupon;
    data['couponName'] = couponName;
    data['couponDescription'] = couponDescription;
    data['couponCode'] = couponCode;
    data['couponPercent'] = couponPercent;
    data['couponType'] = couponType;
    data['couponTurns'] = couponTurns;
    data['id_store'] = idStore;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    return data;
  }
}