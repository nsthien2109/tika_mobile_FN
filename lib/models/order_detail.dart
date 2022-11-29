class OrderDetailModel {
  String? message;
  List<DataOrderDetail>? data;

  OrderDetailModel({this.message, this.data});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <DataOrderDetail>[];
      json['data'].forEach((v) {
        data!.add(DataOrderDetail.fromJson(v));
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

class DataOrderDetail {
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
  int? idOrderDetail;
  int? idProduct;
  int? idSize;
  int? idColor;
  int? quantity;
  String? statusType;
  double? total;
  String? productImage;
  String? productName;

  DataOrderDetail(
      {this.idOrder,
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
      this.orderNotes,
      this.idOrderDetail,
      this.idProduct,
      this.idSize,
      this.idColor,
      this.quantity,
      this.statusType,
      this.total,
      this.productImage,
      this.productName
      }
    );

  DataOrderDetail.fromJson(Map<String, dynamic> json) {
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
    idOrderDetail = json['id_order_detail'];
    idProduct = json['id_product'];
    idSize = json['id_size'];
    idColor = json['id_color'];
    quantity = json['quantity'];
    statusType = json['statusType'];
    total = json['total'];
    productImage = json['productImage'];
    productName = json['productName'];
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
    data['id_order_detail'] = idOrderDetail;
    data['id_product'] = idProduct;
    data['id_size'] = idSize;
    data['id_color'] = idColor;
    data['quantity'] = quantity;
    data['statusType'] = statusType;
    data['total'] = total;
    data['productImage'] = productImage;
    data['productName'] = productName;
    return data;
  }
}