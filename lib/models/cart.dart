class CartModel {
  String? message;
  List<DataCart>? data;

  CartModel({this.message, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <DataCart>[];
      json['data'].forEach((v) {
        data!.add(DataCart.fromJson(v));
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

class DataCart {
  int? idCart;
  int? idProduct;
  int? quantity;
  int? idColor;
  int? idSize;
  int? idUser;
  String? productName;
  String? productDescription;
  double? productPrice;
  String? productAmount;
  String? productImage;
  int? purchases;
  int? likes;
  int? comments;
  String? discount;
  int? idStore;
  int? idCategory;
  int? idSubCategory;
  int? idBrand;

  DataCart(
      {this.idCart,
      this.idProduct,
      this.quantity,
      this.idColor,
      this.idSize,
      this.idUser,
      this.productName,
      this.productDescription,
      this.productPrice,
      this.productAmount,
      this.productImage,
      this.purchases,
      this.likes,
      this.comments,
      this.discount,
      this.idStore,
      this.idCategory,
      this.idSubCategory,
      this.idBrand});

  DataCart.fromJson(Map<String, dynamic> json) {
    idCart = json['id_cart'];
    idProduct = json['id_product'];
    quantity = json['quantity'];
    idColor = json['id_color'];
    idSize = json['id_size'];
    idUser = json['id_user'];
    productName = json['productName'];
    productDescription = json['productDescription'];
    productPrice = json['productPrice'];
    productAmount = json['productAmount'];
    productImage = json['productImage'];
    purchases = json['purchases'];
    likes = json['likes'];
    comments = json['comments'];
    discount = json['discount'];
    idStore = json['id_store'];
    idCategory = json['id_category'];
    idSubCategory = json['id_sub_category'];
    idBrand = json['id_brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_cart'] = idCart;
    data['id_product'] = idProduct;
    data['quantity'] = quantity;
    data['id_color'] = idColor;
    data['id_size'] = idSize;
    data['id_user'] = idUser;
    data['productName'] = productName;
    data['productDescription'] = productDescription;
    data['productPrice'] = productPrice;
    data['productAmount'] = productAmount;
    data['productImage'] = productImage;
    data['purchases'] = purchases;
    data['likes'] = likes;
    data['comments'] = comments;
    data['discount'] = discount;
    data['id_store'] = idStore;
    data['id_category'] = idCategory;
    data['id_sub_category'] = idSubCategory;
    data['id_brand'] = idBrand;
    return data;
  }
}