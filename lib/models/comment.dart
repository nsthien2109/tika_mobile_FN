class CommentModel {
  String? message;
  List<DataComment>? data;

  CommentModel({this.message, this.data});

  CommentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <DataComment>[];
      json['data'].forEach((v) {
        data!.add(DataComment.fromJson(v));
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

class DataComment {
  int? idComment;
  int? idProduct;
  int? idUser;
  int? starRate;
  String? commentContent;
  String? lastName;

  DataComment(
      {this.idComment,
      this.idProduct,
      this.idUser,
      this.starRate,
      this.commentContent,
      this.lastName});

  DataComment.fromJson(Map<String, dynamic> json) {
    idComment = json['id_comment'];
    idProduct = json['id_product'];
    idUser = json['id_user'];
    starRate = json['star_rate'];
    commentContent = json['commentContent'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_comment'] = idComment;
    data['id_product'] = idProduct;
    data['id_user'] = idUser;
    data['star_rate'] = starRate;
    data['commentContent'] = commentContent;
    data['lastName'] = lastName;
    return data;
  }
}