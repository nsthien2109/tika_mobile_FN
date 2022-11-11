class ProductModel {
  String? message;
  DataProductPage? data;

  ProductModel({this.message, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? DataProductPage.fromJson(json['data']) : null;
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

class DataProductPage {
  int? currentPage;
  List<DataProduct>? data;
  String? firstPageUrl;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  int? total;

  DataProductPage(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.total});

  DataProductPage.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DataProduct>[];
      json['data'].forEach((v) {
        data!.add(DataProduct.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['total'] = total;
    return data;
  }
}

class DataProduct {
  int? idProduct;
  String? productName;
  String? productDescription;
  String? productPrice;
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
  String? categoryName;
  int? numProducts;
  String? brandName;
  String? subCategoryName;

  DataProduct(
      {this.idProduct,
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
      this.idBrand,
      this.categoryName,
      this.numProducts,
      this.brandName,
      this.subCategoryName
      });

  DataProduct.fromJson(Map<String, dynamic> json) {
    idProduct = json['id_product'];
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
    categoryName = json['categoryName'];
    numProducts = json['numProducts'];
    brandName = json['brandName'];
    subCategoryName = json['subCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_product'] = idProduct;
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
    data['categoryName'] = categoryName;
    data['numProducts'] = numProducts;
    data['brandName'] = brandName;
    data['subCategoryName'] = subCategoryName;
    return data;
  }
}