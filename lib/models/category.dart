class CategoryModel {
  String? message;
  List<DataCategory>? data;

  CategoryModel({this.message, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <DataCategory>[];
      json['data'].forEach((v) {
        data!.add(DataCategory.fromJson(v));
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

class DataCategory {
  int? idCategory;
  String? categoryName;
  String? categoryImage;
  String? categoryDescription;
  int? numProducts;

  DataCategory(
      {this.idCategory,
      this.categoryName,
      this.categoryImage,
      this.categoryDescription,
      this.numProducts});

  DataCategory.fromJson(Map<String, dynamic> json) {
    idCategory = json['id_category'];
    categoryName = json['categoryName'];
    categoryImage = json['categoryImage'];
    categoryDescription = json['categoryDescription'];
    numProducts = json['numProducts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_category'] = idCategory;
    data['categoryName'] = categoryName;
    data['categoryImage'] = categoryImage;
    data['categoryDescription'] = categoryDescription;
    data['numProducts'] = numProducts;
    return data;
  }
}