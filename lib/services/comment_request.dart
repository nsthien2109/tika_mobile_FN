// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/models/comment.dart';

class CommentService {
  static Future<CommentModel?> getComments(idProduct) async {
    final response = await http.get(Uri.parse('$domain/comments/$idProduct'));
    if (response.statusCode == 200) {
      final commentResponse = json.decode(response.body);
      final commentData = commentResponse['data'] as List<dynamic>;
      final List<DataComment> comments = [];
      commentData.forEach((cmt) => {
            comments.add(
              DataComment(
                idComment: cmt['id_comment'],
                idProduct: cmt['id_product'],
                idUser: cmt['id_user'],
                starRate: cmt['star_rate'],
                commentContent: cmt['commentContent'],
                lastName: cmt['lastName']
              )
            )
          });
      return CommentModel(message: commentResponse['message'], data: comments);
    } else {
      final commentResponse = json.decode(response.body);
      return CommentModel(message: commentResponse['message'], data: []);
    }
  }
}
