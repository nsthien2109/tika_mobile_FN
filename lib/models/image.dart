class ImageModel {
  String? message;
  List<DataImage>? data;

  ImageModel({this.message, this.data});

  ImageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <DataImage>[];
      json['data'].forEach((v) {
        data!.add(DataImage.fromJson(v));
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

class DataImage {
  int? idImage;
  String? url;
  int? idProduct;

  DataImage(
      {this.idImage, this.url, this.idProduct});

  DataImage.fromJson(Map<String, dynamic> json) {
    idImage = json['id_image'];
    url = json['url'];
    idProduct = json['id_product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_image'] = idImage;
    data['url'] = url;
    data['id_product'] = idProduct;
    return data;
  }
}