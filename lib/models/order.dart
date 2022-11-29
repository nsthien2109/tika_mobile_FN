class OrderModel {
  String? message;
  List<DataOrder>? data;

  OrderModel({this.message, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <DataOrder>[];
      json['data'].forEach((v) {
        data!.add(DataOrder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataOrder {
  int? idOrder;
  int? idUser;
  String? addressProvince;
  String? addressDistrict;
  String? addressCommune;
  String? addressSpecific;
  String? orderEmail;
  String? orderPhone;
  String? orderName;
  String? orderCoupon;
  double? orderDiscount;
  double? feeship;
  double? orderTotal;
  String? paymentMethod;
  String? orderNotes;

  DataOrder(
    {
      this.idOrder,
      this.idUser,
      this.addressProvince,
      this.addressDistrict,
      this.addressCommune,
      this.addressSpecific,
      this.orderEmail,
      this.orderPhone,
      this.orderName,
      this.orderCoupon,
      this.orderDiscount,
      this.feeship,
      this.orderTotal,
      this.paymentMethod,
      this.orderNotes
      }
    );

  DataOrder.fromJson(Map<String, dynamic> json) {
    idOrder = json['id_order'];
    idUser = json['id_user'];
    addressProvince = json['addressProvince'];
    addressDistrict = json['addressDistrict'];
    addressCommune = json['addressCommune'];
    addressSpecific = json['addressSpecific'];
    orderEmail = json['orderEmail'];
    orderPhone = json['orderPhone'];
    orderName = json['orderName'];
    orderCoupon = json['orderCoupon'];
    orderDiscount = json['orderDiscount'];
    feeship = json['feeship'];
    orderTotal = json['orderTotal'];
    paymentMethod = json['paymentMethod'];
    orderNotes = json['orderNotes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_order'] = idOrder;
    data['id_user'] = idUser;
    data['addressProvince'] = addressProvince;
    data['addressDistrict'] = addressDistrict;
    data['addressCommune'] = addressCommune;
    data['addressSpecific'] = addressSpecific;
    data['orderEmail'] = orderEmail;
    data['orderPhone'] = orderPhone;
    data['orderName'] = orderName;
    data['orderCoupon'] = orderCoupon;
    data['orderDiscount'] = orderDiscount;
    data['feeship'] = feeship;
    data['orderTotal'] = orderTotal;
    data['paymentMethod'] = paymentMethod;
    data['orderNotes'] = orderNotes;
    return data;
  }
}