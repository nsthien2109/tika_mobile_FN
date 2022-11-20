class WishListModel {
  String? message;
  List<DataWishList>? data;

  WishListModel({this.message, this.data});

  WishListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <DataWishList>[];
      json['data'].forEach((v) {
        data!.add(DataWishList.fromJson(v));
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

class DataWishList {
  int? idFavorite;
  int? idProduct;
  int? idUser;
  String? productName;
  String? productPrice;
  String? productAmount;
  String? productImage;
  int? comments;
  String? discount;

  DataWishList(
      {this.idFavorite,
      this.idProduct,
      this.idUser,
      this.productName,
      this.productPrice,
      this.productAmount,
      this.productImage,
      this.comments,
      this.discount
      });

  DataWishList.fromJson(Map<String, dynamic> json) {
    idFavorite = json['id_favorite'];
    idProduct = json['id_product'];
    idUser = json['id_user'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    productAmount = json['productAmount'];
    productImage = json['productImage'];
    comments = json['comments'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_favorite'] = idFavorite;
    data['id_product'] = idProduct;
    data['id_user'] = idUser;
    data['productName'] = productName;
    data['productPrice'] = productPrice;
    data['productAmount'] = productAmount;
    data['productImage'] = productImage;
    data['comments'] = comments;
    data['discount'] = discount;
    return data;
  }
}