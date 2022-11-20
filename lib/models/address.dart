class AddressModel {
  String? message;
  DataAddress? data;

  AddressModel({this.message, this.data});

  AddressModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? DataAddress.fromJson(json['data']) : null;
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

class DataAddress {
  int? idAddress;
  int? idUser;
  String? addressProvince;
  String? addressDistrict;
  String? addressCommune;
  String? addressSpecific;
  String? firstName;
  String? lastName;
  String? phone;

  DataAddress(
      {this.idAddress,
      this.idUser,
      this.addressProvince,
      this.addressDistrict,
      this.addressCommune,
      this.addressSpecific,
      this.firstName,
      this.lastName,
      this.phone});

  DataAddress.fromJson(Map<String, dynamic> json) {
    idAddress = json['id_address'];
    idUser = json['id_user'];
    addressProvince = json['addressProvince'];
    addressDistrict = json['addressDistrict'];
    addressCommune = json['addressCommune'];
    addressSpecific = json['addressSpecific'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_address'] = idAddress;
    data['id_user'] = idUser;
    data['addressProvince'] = addressProvince;
    data['addressDistrict'] = addressDistrict;
    data['addressCommune'] = addressCommune;
    data['addressSpecific'] = addressSpecific;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    return data;
  }
}