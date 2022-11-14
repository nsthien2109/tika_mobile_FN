// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/models/image.dart';

class ImageService {
  static Future<ImageModel?> getImages(idProduct) async {
    final response = await http.get(Uri.parse('$domain/images/$idProduct'));
    if (response.statusCode == 200) {
      final imageResponse = json.decode(response.body);
      final imageData = imageResponse['data'] as List<dynamic>;
      final List<DataImage> images = [];
      imageData.forEach((img) => {
            images.add(DataImage(
                idImage: img['id_image'],
                idProduct: img['id_product'],
                url: img['url'],
              )
            )
          });
      return ImageModel(message: imageResponse['message'], data: images);
    } else {
      final imageResponse = json.decode(response.body);
      return ImageModel(message: imageResponse['message'], data: []);
    }
  }
}
