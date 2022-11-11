class BannerModel {
  String? message;
  List<DataBanner>? data;

  BannerModel({this.message, this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <DataBanner>[];
      json['data'].forEach((v) {
        data!.add(DataBanner.fromJson(v));
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

class DataBanner {
  int? idBanner;
  String? bannerName;
  String? bannerDescription;
  String? bannerImage;
  String? bannerUrl;

  DataBanner(
      {this.idBanner,
      this.bannerName,
      this.bannerDescription,
      this.bannerImage,
      this.bannerUrl});

  DataBanner.fromJson(Map<String, dynamic> json) {
    idBanner = json['id_banner'];
    bannerName = json['bannerName'];
    bannerDescription = json['bannerDescription'];
    bannerImage = json['bannerImage'];
    bannerUrl = json['bannerUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_banner'] = idBanner;
    data['bannerName'] = bannerName;
    data['bannerDescription'] = bannerDescription;
    data['bannerImage'] = bannerImage;
    data['bannerUrl'] = bannerUrl;
    return data;
  }
}
