// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/models/variant.dart';

class VariantService {

  static Future<VariantModel?> getVariants(idProduct) async {
    final response = await http.get(Uri.parse('$domain/release/$idProduct'));
    if (response.statusCode == 200) {
      final variantResponse = json.decode(response.body);
      final sizeData = variantResponse['data']['sizes'] as List<dynamic>;
      final colorData = variantResponse['data']['colors'] as List<dynamic>;
      final List<DataSize> sizes = [];
      final List<DataColor> colors = [];
      sizeData.forEach((size) => {
        sizes.add(
          DataSize(
            idProductRelease: size['id_product_release'],
            idSize: size['id_size'],
            idProduct: size['id_product'],
            idColor: size['id_color'],
            sizeName: size['sizeName']
          )
        )
      });

      colorData.forEach((color) => {
        colors.add(
          DataColor(
            idProductRelease: color['id_product_release'],
            idSize: color['id_size'],
            idProduct: color['id_product'],
            idColor: color['id_color'],
            colorName: color['sizeName']
          )
        )
      });

      return VariantModel(
        data: DataVariant(
          colors: colors,
          sizes: sizes
        ),
        message: variantResponse['message']
      );
    } else {
      final variantResponse = json.decode(response.body);
      return VariantModel(message: variantResponse['message'], data: DataVariant());
    }
  }
}
