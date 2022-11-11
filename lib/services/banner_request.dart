// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/models/banner.dart';

class BannerService {
  static Future<BannerModel?> getBanners() async {
    final response = await http.get(Uri.parse('$domain/banners'));
    if (response.statusCode == 200) {
      final bannerResponse = json.decode(response.body);
      final bannerData = bannerResponse['data'] as List<dynamic>;
      final List<DataBanner> banners = [];
      bannerData.forEach((banner) => {
            banners.add(DataBanner(
                idBanner: banner['id_banner'],
                bannerDescription: banner['bannerDescription'],
                bannerImage: banner['bannerImage'],
                bannerName: banner['bannerName'],
                bannerUrl: banner['bannerUrl']))
          });
      return BannerModel(message: bannerResponse['message'], data: banners);
    } else {
      final bannerResponse = json.decode(response.body);
      return BannerModel(message: bannerResponse['message'], data: []);
    }
  }
}
