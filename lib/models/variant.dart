class VariantModel {
  String? message;
  DataVariant? data;

  VariantModel({this.message, this.data});

  VariantModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? DataVariant.fromJson(json['data']) : null;
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

class DataVariant {
  List<DataSize>? sizes;
  List<DataColor>? colors;

  DataVariant({this.sizes, this.colors});

  DataVariant.fromJson(Map<String, dynamic> json) {
    if (json['sizes'] != null) {
      sizes = <DataSize>[];
      json['sizes'].forEach((v) {
        sizes!.add(DataSize.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = <DataColor>[];
      json['colors'].forEach((v) {
        colors!.add(DataColor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sizes != null) {
      data['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    if (colors != null) {
      data['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataSize {
  int? idProductRelease;
  int? idSize;
  int? idColor;
  String? idProduct;
  String? sizeName;

  DataSize(
      {this.idProductRelease,
      this.idSize,
      this.idColor,
      this.idProduct,
      this.sizeName});

  DataSize.fromJson(Map<String, dynamic> json) {
    idProductRelease = json['id_product_release'];
    idSize = json['id_size'];
    idColor = json['id_color'];
    idProduct = json['id_product'];
    sizeName = json['sizeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_product_release'] = idProductRelease;
    data['id_size'] = idSize;
    data['id_color'] = idColor;
    data['id_product'] = idProduct;
    data['sizeName'] = sizeName;
    return data;
  }
}

class DataColor {
  int? idProductRelease;
  int? idSize;
  int? idColor;
  String? idProduct;
  String? colorName;

  DataColor(
      {this.idProductRelease,
      this.idSize,
      this.idColor,
      this.idProduct,
      this.colorName});

  DataColor.fromJson(Map<String, dynamic> json) {
    idProductRelease = json['id_product_release'];
    idSize = json['id_size'];
    idColor = json['id_color'];
    idProduct = json['id_product'];
    colorName = json['colorName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_product_release'] = idProductRelease;
    data['id_size'] = idSize;
    data['id_color'] = idColor;
    data['id_product'] = idProduct;
    data['colorName'] = colorName;
    return data;
  }
}